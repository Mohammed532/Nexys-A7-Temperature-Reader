/** 
 * sevseg_writer.c
 * Mohammed Akinbayo
 *
 * writes string to sev segment display
 */

#ifndef SEVSEG_WRITER_H			/* prevent circular inclusions */
#define SEVSEG_WRITER_H	

#include <stdbool.h>
#include "xgpio.h"

/**
 * PUBLIC
 * writes text to seven segment display
 * @param sevseg_ptr pointer to seven segment display device
 * @param text string to display
 * @return fail/pass writing to display
 */
bool seg_print(XGpio *sevseg_ptr, char text[]);
// bool write_char(XGpio *sevseg_ptr, char seg_char, u32 anode_mask);

#endif