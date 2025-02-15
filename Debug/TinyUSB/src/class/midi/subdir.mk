################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../TinyUSB/src/class/midi/midi_device.c 

OBJS += \
./TinyUSB/src/class/midi/midi_device.o 

C_DEPS += \
./TinyUSB/src/class/midi/midi_device.d 


# Each subdirectory must supply rules for building sources it contributes
TinyUSB/src/class/midi/%.o TinyUSB/src/class/midi/%.su TinyUSB/src/class/midi/%.cyclo: ../TinyUSB/src/class/midi/%.c TinyUSB/src/class/midi/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DDEBUG -DSTM32F103xB -DUSE_FULL_LL_DRIVER -DUSE_HAL_DRIVER -c -I../Core/Inc -I../Drivers/STM32F1xx_HAL_Driver/Inc -I../Drivers/CMSIS/Device/ST/STM32F1xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/mines/Downloads/Pedals/Pedals_Controller/TinyUSB/src" -I../Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

clean: clean-TinyUSB-2f-src-2f-class-2f-midi

clean-TinyUSB-2f-src-2f-class-2f-midi:
	-$(RM) ./TinyUSB/src/class/midi/midi_device.cyclo ./TinyUSB/src/class/midi/midi_device.d ./TinyUSB/src/class/midi/midi_device.o ./TinyUSB/src/class/midi/midi_device.su

.PHONY: clean-TinyUSB-2f-src-2f-class-2f-midi

