################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../TinyUSB/src/portable/wch/dcd_ch32_usbfs.c \
../TinyUSB/src/portable/wch/dcd_ch32_usbhs.c 

OBJS += \
./TinyUSB/src/portable/wch/dcd_ch32_usbfs.o \
./TinyUSB/src/portable/wch/dcd_ch32_usbhs.o 

C_DEPS += \
./TinyUSB/src/portable/wch/dcd_ch32_usbfs.d \
./TinyUSB/src/portable/wch/dcd_ch32_usbhs.d 


# Each subdirectory must supply rules for building sources it contributes
TinyUSB/src/portable/wch/%.o TinyUSB/src/portable/wch/%.su TinyUSB/src/portable/wch/%.cyclo: ../TinyUSB/src/portable/wch/%.c TinyUSB/src/portable/wch/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DDEBUG -DSTM32F103xB -DUSE_FULL_LL_DRIVER -DUSE_HAL_DRIVER -c -I../Core/Inc -I../Drivers/STM32F1xx_HAL_Driver/Inc -I../Drivers/CMSIS/Device/ST/STM32F1xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/mines/Downloads/Pedals/Pedals_Controller/TinyUSB/src" -I../Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

clean: clean-TinyUSB-2f-src-2f-portable-2f-wch

clean-TinyUSB-2f-src-2f-portable-2f-wch:
	-$(RM) ./TinyUSB/src/portable/wch/dcd_ch32_usbfs.cyclo ./TinyUSB/src/portable/wch/dcd_ch32_usbfs.d ./TinyUSB/src/portable/wch/dcd_ch32_usbfs.o ./TinyUSB/src/portable/wch/dcd_ch32_usbfs.su ./TinyUSB/src/portable/wch/dcd_ch32_usbhs.cyclo ./TinyUSB/src/portable/wch/dcd_ch32_usbhs.d ./TinyUSB/src/portable/wch/dcd_ch32_usbhs.o ./TinyUSB/src/portable/wch/dcd_ch32_usbhs.su

.PHONY: clean-TinyUSB-2f-src-2f-portable-2f-wch

