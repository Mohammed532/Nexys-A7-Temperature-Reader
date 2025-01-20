/**
 * temp_sensor_reader.h
 * Mohammed Akinbayo
 *
 * Interface for ADT7420 to read tempurature using xiic.h library
 *
 *
 * Sensor documentation: https://www.analog.com/media/en/technical-documentation/data-sheets/ADT7420.pdf
 */

#ifndef TEMP_SENSOR_READER_H			/* prevent circular inclusions */
#define TEMP_SENSOR_READER_H

#include "xil_types.h"
#include "xiic.h"

/* enums for sensor configuration */
//Polarity for INT and CNT pins
typedef enum {ACTIVE_LOW, ACTIVE_HIGH} SENS_POLARITY;
// Mode of sensor
typedef enum {INTERRUPT, COMPARATOR} SENS_MODE;
// Operational mode of sensor
typedef enum {CONTINOUS, ONE_SHOT, SPS, SHUTDOWN} SENS_OP_MODE;
// Sensor resolution
typedef enum {BIT_13, BIT_16} SENS_RESO;

/* configuration settings for the sensor. Used to set the value in  */
/* configuration register.                                          */
typedef struct {
    // "These two bits set the number of undertemperature/overtemperature faults that can occur before setting the
    // INT and CT pins. This helps to avoid false triggering due to temperature noise."
    // DEFAULT: 00 (1 fault)
    int FAULT_QUEUE;

    // "This bit selects the output polarity of the CT pin"
    // DEFAULT: 0 (ACTIVE_LOW)
    SENS_POLARITY CT_POLARITY;

    // "This bit selects the output polarity of the INT pin."
    // DEFAULT: 0 (ACTIVE_LOW)
    SENS_POLARITY INT_POLARITY;

    // "This bit selects between comparator mode and interrupt mode."
    // DEFAULT: 0 (INTERRUPT)
    SENS_MODE MODE;

    // "These two bits set the operational mode for the ADT7420."
    // DEFAULT: 00 (CONTINOUS)
    SENS_OP_MODE OP_MODE;

    // "This bit sets up the resolution of the ADC when converting."
    // DEFAULT: 0 (13bit)
    SENS_RESO RESOLUTION;
} TSensCfg;


int TS_initialize(XIic *t_sensor_ptr, TSensCfg cfg);
int TS_set_config(TSensCfg cfg);
float TS_read_temp();

#endif