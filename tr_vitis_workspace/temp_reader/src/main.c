/* main.c
 * 
 * 
 */

#include <stdio.h>
#include "xstatus.h"
#include "xparameters.h"
// #include "xil_printf.h"
#include "xgpio.h"
#include "xiic.h"
#include "xiic_l.h"
#include "xil_types.h"

#include "headers/sevseg_writer.h"
#include "headers/temp_sensor_reader.h"


/* DEVICES */

//btns
#define BTN_ADDR XPAR_AXI_GPIO_BTNS_BASEADDR
#define BTN_CHANNEL 1
#define BTN_MASK 0b1000

// seven seg display
#define SEVSEG_ADDR XPAR_AXI_GPIO_SEVEN_SEG_BASEADDR
#define SEVSEG_CATHODE_CHANNEL 1
#define SEVSEG_ANODE_CHANNEL 2

// temp sensor
#define TEMP_SENS_ADDR XPAR_AXI_IIC_0_BASEADDR
#define TEMP_SENS_SLAVE_ADDR 0x4b               // iic bus address for sensor
#define TEMP_SENS_ID_REG 0x0b                   // sensor id register (default value should be 0xCB)
#define TEMP_SENS_CONFIG_REG 0x03               // sensor configuration register
#define TEMP_SENS_VAL_MSB 0x00                  // MSB register for tempurature value


int main(){
    XGpio btn, sevseg;
    XIic t_sensor;
    XGpio_Config *gp_config;
    XIic_Config *xi_config;
    int status; // stores status code for Xgpio and Xiic functions

    /* init configuration */
    // btns
    gp_config = XGpio_LookupConfig(BTN_ADDR);
    XGpio_CfgInitialize(&btn, gp_config, gp_config->BaseAddress);
    XGpio_SetDataDirection(&btn, BTN_CHANNEL, BTN_MASK);

    //sevseg
    gp_config = XGpio_LookupConfig(SEVSEG_ADDR);
    XGpio_CfgInitialize(&sevseg, gp_config, gp_config->BaseAddress);

    //temp sensor
    xi_config = XIic_LookupConfig(TEMP_SENS_ADDR);
    if (xi_config == NULL){
        xil_printf("Tempurature Sensor Lookup Failed.\r\n");
        return XST_FAILURE;
    }
    XIic_CfgInitialize(&t_sensor, xi_config, xi_config->BaseAddress);
    XIic_SetAddress(&t_sensor, XII_ADDR_TO_SEND_TYPE, TEMP_SENS_SLAVE_ADDR);
    
    // temp sensor reader
    TSensCfg ts_cfg = {
        0b00,
        ACTIVE_LOW,
        ACTIVE_LOW,
        INTERRUPT,
        CONTINOUS,
        BIT_16
    };
    TS_initialize(&t_sensor, ts_cfg);


    /* main loop */
    float data;
    while(1){
        char temp_str[16];
        data = TS_read_temp();
        snprintf(temp_str, 16, "%.2f C", data);
        seg_print(&sevseg, temp_str);
        //dirty delay
        //for(volatile int i; i < 100000000; i++){}
    }        

    return 0;
}