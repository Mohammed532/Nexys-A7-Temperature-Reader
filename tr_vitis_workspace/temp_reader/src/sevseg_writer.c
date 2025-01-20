/** 
 * sevseg_writer.c
 * Mohammed Akinbayo
 *
 * writes string to sev segment display
 *
 * TODO: need to fix for "..." test case. This case is not important for this specific project,
 * so very low urgency.
 *
 * TODO: Implement xstatus codes instead of bools
 */


#include <stdio.h>
#include <stdbool.h>
#include "xgpio.h"


#define CATHODE_CHANNEL         1
#define ANODE_CHANNEL           2

// seven segment binary rom
// stores binary representation of sev segment characters
// (allocated for 127 possible ascii characters, decimal value of ascii code is used as index value)
unsigned short int bin_rom[127] = {
    [32] = 0b00000000, //SPACE

    [48] = 0b00111111, //0
    [49] = 0b00000110, //1
    [50] = 0b01011011, //2
    [51] = 0b01001111, //3
    [52] = 0b01100110, //4
    [53] = 0b01101101, //5
    [54] = 0b01111101, //6
    [55] = 0b00000111, //7
    [56] = 0b01111111, //8
    [57] = 0b01101111, //9

    [65] = 0b01110111, //A
    [66] = 0b01111100, //B
    [67] = 0b00111001, //C
    [68] = 0b01011110, //D
    [69] = 0b01111001, //E
    [70] = 0b01110001, //F
    [71] = 0b00111101, //G
    [72] = 0b01110100, //H
    [73] = 0b00000100, //I
    [74] = 0b00011110, //J
    [75] = 0b01110101, //K
    [76] = 0b00111000, //L
    [77] = 0b01010101, //M
    [78] = 0b01010100, //N
    [79] = 0b01011100, //O
    [80] = 0b01110011, //P
    [81] = 0b01100111, //Q
    [82] = 0b01010000, //R
    [83] = 0b01101101, //S
    [84] = 0b01111000, //T
    [85] = 0b00111110, //U
    [86] = 0b00011100, //V
    [87] = 0b01101010, //Y
    [88] = 0b01110110, //X
    [89] = 0b01101110, //Y
    [90] = 0b01011011, //Z    
    
};

/* CHARACTER ASSESSMENT STATE */
enum CHAR_STATUS {
    INVALID,        // Char is not implemented in bin_rom
    LWRCASE,        // char is lowercase
    DECIMALP,       // char is a decimal point
    VALID           // char is valid for displaying
};

// global config variables
enum CHAR_STATUS CSTATUS;
bool DP_FLAG = false; //checks for continous decimal points (unimplemented)

/**
 * PRIVATE
 * clears cathode and anode channel, resets back to 0xff
 * @param sevseg_ptr pointer to seven segment display device
 */
void initialize(XGpio *sevseg_ptr){
    XGpio_DiscreteWrite(sevseg_ptr, CATHODE_CHANNEL, 0xff);
    XGpio_DiscreteWrite(sevseg_ptr, ANODE_CHANNEL, 0xff);
}

/**
 * PRIVATE
 * updates global enum CSTATUS depending on input character
 * @param seg_char character to be assessed
 */
int assess_char(char seg_char){
    // checks if char is lowercase
    if(seg_char >= 97 && seg_char <= 122){
        return LWRCASE;
    }

    //checks if character is a decimal point
    if(seg_char == '.'){
        DP_FLAG = true;
        return DECIMALP;
    }

    // checks the ascii value to determine if char is in bin_rom
    if(!(seg_char >= 48 && seg_char <= 57) && 
       !(seg_char >= 65 && seg_char <= 90) && 
       !(seg_char == ' ')){
        return INVALID;
    }

    // test cases fell through, char is valid for printing
    return VALID;
}

/**
 * PRIVATE
 * writes character to seven seg display
 * @param sevseg_ptr pointer to seven segment display device
 * @param seg_char character to be written
 * @param anode_mask anode (display digit) to write character to
 * @return fail/pass writing to display
 */
bool write_char(XGpio *sevseg_ptr, char seg_char, u32 anode_mask){
    unsigned short int char_bin = 0;
    u32 prev_char;

    switch (CSTATUS) {
        case INVALID:
            printf("Invalid Character: %c\n", seg_char);
            return false; //Error
        case LWRCASE:
            char_bin += ~bin_rom[(int)seg_char - 32];
            break;
        case DECIMALP:
            //dp_flag = true;
            prev_char = ~XGpio_DiscreteRead(sevseg_ptr, CATHODE_CHANNEL);
            char_bin += ~(prev_char + 0b10000000);
            break;
        case VALID:
            char_bin += ~bin_rom[(int)seg_char];
            break;
    }

    XGpio_DiscreteWrite(sevseg_ptr, CATHODE_CHANNEL, char_bin);
    XGpio_DiscreteWrite(sevseg_ptr, ANODE_CHANNEL, ~anode_mask);
    XGpio_DiscreteWrite(sevseg_ptr, ANODE_CHANNEL, ~0);

    return true;
}

/**
 * PUBLIC
 * writes text to seven segment display
 * @param sevseg_ptr pointer to seven segment display device
 * @param text string to display
 * @return fail/pass writing to display
 */
bool seg_print(XGpio *sevseg_ptr, char text[]){
    initialize(sevseg_ptr);
    bool run_status;

    u32 anode_mask = 0b10000000;
    for(int i = 0; i < strlen(text); i++){
        if (anode_mask == 0){break;} // prevents segment display overflow
        CSTATUS = assess_char(text[i]);

        if (CSTATUS == DECIMALP && anode_mask != 0b10000000){
            anode_mask <<= 1;
            run_status = write_char(sevseg_ptr, text[i], anode_mask);
        }
        else{
            run_status = write_char(sevseg_ptr, text[i], anode_mask);
        }

        anode_mask >>= 1;
    }

    return run_status;
}
