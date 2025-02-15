################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../TinyUSB/src/portable/nxp/lpc17_40/dcd_lpc17_40.c \
../TinyUSB/src/portable/nxp/lpc17_40/hcd_lpc17_40.c 

OBJS += \
./TinyUSB/src/portable/nxp/lpc17_40/dcd_lpc17_40.o \
./TinyUSB/src/portable/nxp/lpc17_40/hcd_lpc17_40.o 

C_DEPS += \
./TinyUSB/src/portable/nxp/lpc17_40/dcd_lpc17_40.d \
./TinyUSB/src/portable/nxp/lpc17_40/hcd_lpc17_40.d 


# Each subdirectory must supply rules for building sources it contributes
TinyUSB/src/portable/nxp/lpc17_40/%.o TinyUSB/src/portable/nxp/lpc17_40/%.su TinyUSB/src/portable/nxp/lpc17_40/%.cyclo: ../TinyUSB/src/portable/nxp/lpc17_40/%.c TinyUSB/src/portable/nxp/lpc17_40/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DDEBUG -DSTM32F103xB -DUSE_FULL_LL_DRIVER -DUSE_HAL_DRIVER -c -I../Core/Inc -I../Drivers/STM32F1xx_HAL_Driver/Inc -I../Drivers/CMSIS/Device/ST/STM32F1xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/mines/Downloads/Pedals/Pedals_Controller/TinyUSB/src" -I../Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

clean: clean-TinyUSB-2f-src-2f-portable-2f-nxp-2f-lpc17_40

clean-TinyUSB-2f-src-2f-portable-2f-nxp-2f-lpc17_40:
	-$(RM) ./TinyUSB/src/portable/nxp/lpc17_40/dcd_lpc17_40.cyclo ./TinyUSB/src/portable/nxp/lpc17_40/dcd_lpc17_40.d ./TinyUSB/src/portable/nxp/lpc17_40/dcd_lpc17_40.o ./TinyUSB/src/portable/nxp/lpc17_40/dcd_lpc17_40.su ./TinyUSB/src/portable/nxp/lpc17_40/hcd_lpc17_40.cyclo ./TinyUSB/src/portable/nxp/lpc17_40/hcd_lpc17_40.d ./TinyUSB/src/portable/nxp/lpc17_40/hcd_lpc17_40.o ./TinyUSB/src/portable/nxp/lpc17_40/hcd_lpc17_40.su

.PHONY: clean-TinyUSB-2f-src-2f-portable-2f-nxp-2f-lpc17_40

