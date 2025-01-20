/**
 * temp_sensor_reader.c
 * Mohammed Akinbayo
 *
 * Interface for ADT7420 to read tempurature using xiic.h library
 *
 * Sensor documentation: https://www.analog.com/media/en/technical-documentation/data-sheets/ADT7420.pdf
 *
 * SensCfg is defined in header file
 */

#include <stdio.h>
#include "headers/temp_sensor_reader.h"
#include "xiic.h"
#include "xiic_l.h"
#include "xstatus.h"


// tempurature sensor registers
#define TEMP_SENS_SLAVE_ADDR 0x4b               // iic bus address for sensor
#define TEMP_SENS_ID_REG 0x0b                   // sensor id register (default value should be 0xCB)
#define TEMP_SENS_CONFIG_REG 0x03               // sensor configuration register
#define TEMP_SENS_STATUS_REG 0x02               // sensor status register (T_high, T_low, T_crit)
#define TEMP_SENS_VAL_MSB 0x00                  // MSB register for tempurature value


// global config variables
XIic *t_sensor;
TSensCfg ts_cfg;

/**
 * PUBLIC
 * set configuration struct
 * @param cfg SensCfg object for setting configuration of sensor
 * @return Xilinx software status code
 */
int TS_set_config(TSensCfg cfg){
    if(t_sensor == NULL){
        xil_printf("Tempurature Sensor Not Initialized\r\n");
        return XST_FAILURE;
    }

    int status;
    u8 data[2];
    u8 cfg_buffer = 0b0;
    ts_cfg = cfg;


    cfg_buffer +=   (ts_cfg.FAULT_QUEUE) +          // set config bit [1:0]
                    (ts_cfg.CT_POLARITY << 2) +     // set config bit 2
                    (ts_cfg.INT_POLARITY << 3) +    // set config bit 3
                    (ts_cfg.MODE << 4) +            // set config bit 4
                    (ts_cfg.OP_MODE << 5) +         // set config bit [6:5]
                    (ts_cfg.RESOLUTION << 7);       // set config bit 7

    //write config to config reg
    data[0] = TEMP_SENS_CONFIG_REG;
    data[1] = cfg_buffer;

    status = XIic_Send(t_sensor->BaseAddress, TEMP_SENS_SLAVE_ADDR, data, 2, XIIC_STOP);
    if(status != 2) { // two bytes not written
        xil_printf("Tempurature Sensor Write Error\r\n");
        return XST_FAILURE;
    }

    return XST_SUCCESS;
}

/**
 * PUBLIC
 * initialize device and set configuration
 * @param t_sensor_ptr pointer to tempurature sensor
 * @param cfg SensCfg object for setting configuration of sensor
 * @return Xilinx software status code
 */
int TS_initialize(XIic *t_sensor_ptr, TSensCfg cfg){
    int status;
    t_sensor = t_sensor_ptr;

    // set configuration
    status = TS_set_config(cfg);
    if(status != XST_SUCCESS){ return status; }

    return XST_SUCCESS;
}

/**
 * PUBLIC
 * reads the tempurature (Celsius)
 * @return floating point tempurature in celsius
 * TODO: implement error handling
 */
float TS_read_temp(){
    // u8 ID_REG = TEMP_SENS_ID_REG;
    // u8 TEMP_REG = TEMP_SENS_VAL_MSB;
    u8 temp_data[2];

    //send the register to read from
    XIic_Send(t_sensor->BaseAddress, TEMP_SENS_SLAVE_ADDR, TEMP_SENS_VAL_MSB, 1, XIIC_REPEATED_START);

    //read from register
    XIic_Recv(t_sensor->BaseAddress, TEMP_SENS_SLAVE_ADDR, temp_data, 2, XIIC_STOP);

    // conversion to celsius
    if(temp_data[0] >> 7 != 1){ //sign bit = 1 (neg temp)
        return ((temp_data[0] << 8) | temp_data[1]) / 128.f;
    } else {
        return (((temp_data[0] << 8) | temp_data[1]) - 65,536) / 128.f;
    }

}


