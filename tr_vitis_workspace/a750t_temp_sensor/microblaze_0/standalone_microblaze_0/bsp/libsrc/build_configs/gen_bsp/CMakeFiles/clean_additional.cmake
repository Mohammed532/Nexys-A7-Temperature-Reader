# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "")
  file(REMOVE_RECURSE
  "C:\\Users\\Mo\\Documents\\A7-50T_Temperature_Reader\\tr_vitis_workspace\\a750t_temp_sensor\\microblaze_0\\standalone_microblaze_0\\bsp\\include\\sleep.h"
  "C:\\Users\\Mo\\Documents\\A7-50T_Temperature_Reader\\tr_vitis_workspace\\a750t_temp_sensor\\microblaze_0\\standalone_microblaze_0\\bsp\\include\\xiltimer.h"
  "C:\\Users\\Mo\\Documents\\A7-50T_Temperature_Reader\\tr_vitis_workspace\\a750t_temp_sensor\\microblaze_0\\standalone_microblaze_0\\bsp\\include\\xtimer_config.h"
  "C:\\Users\\Mo\\Documents\\A7-50T_Temperature_Reader\\tr_vitis_workspace\\a750t_temp_sensor\\microblaze_0\\standalone_microblaze_0\\bsp\\lib\\libxiltimer.a"
  )
endif()
