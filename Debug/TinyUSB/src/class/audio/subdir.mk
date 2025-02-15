################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../TinyUSB/src/class/audio/audio_device.c 

OBJS += \
./TinyUSB/src/class/audio/audio_device.o 

C_DEPS += \
./TinyUSB/src/class/audio/audio_device.d 


# Each subdirectory must supply rules for building sources it contributes
TinyUSB/src/class/audio/%.o TinyUSB/src/class/audio/%.su TinyUSB/src/class/audio/%.cyclo: ../TinyUSB/src/class/audio/%.c TinyUSB/src/class/audio/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DDEBUG -DSTM32F103xB -DUSE_FULL_LL_DRIVER -DUSE_HAL_DRIVER -c -I../Core/Inc -I../Drivers/STM32F1xx_HAL_Driver/Inc -I../Drivers/CMSIS/Device/ST/STM32F1xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/mines/Downloads/Pedals/Pedals_Controller/TinyUSB/src" -I../Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

clean: clean-TinyUSB-2f-src-2f-class-2f-audio

clean-TinyUSB-2f-src-2f-class-2f-audio:
	-$(RM) ./TinyUSB/src/class/audio/audio_device.cyclo ./TinyUSB/src/class/audio/audio_device.d ./TinyUSB/src/class/audio/audio_device.o ./TinyUSB/src/class/audio/audio_device.su

.PHONY: clean-TinyUSB-2f-src-2f-class-2f-audio

