################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../TinyUSB/src/class/msc/msc_device.c \
../TinyUSB/src/class/msc/msc_host.c 

OBJS += \
./TinyUSB/src/class/msc/msc_device.o \
./TinyUSB/src/class/msc/msc_host.o 

C_DEPS += \
./TinyUSB/src/class/msc/msc_device.d \
./TinyUSB/src/class/msc/msc_host.d 


# Each subdirectory must supply rules for building sources it contributes
TinyUSB/src/class/msc/%.o TinyUSB/src/class/msc/%.su TinyUSB/src/class/msc/%.cyclo: ../TinyUSB/src/class/msc/%.c TinyUSB/src/class/msc/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DDEBUG -DSTM32F103xB -DUSE_FULL_LL_DRIVER -DUSE_HAL_DRIVER -c -I../Core/Inc -I../Drivers/STM32F1xx_HAL_Driver/Inc -I../Drivers/CMSIS/Device/ST/STM32F1xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/mines/Downloads/Pedals/Pedals_Controller/TinyUSB/src" -I../Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

clean: clean-TinyUSB-2f-src-2f-class-2f-msc

clean-TinyUSB-2f-src-2f-class-2f-msc:
	-$(RM) ./TinyUSB/src/class/msc/msc_device.cyclo ./TinyUSB/src/class/msc/msc_device.d ./TinyUSB/src/class/msc/msc_device.o ./TinyUSB/src/class/msc/msc_device.su ./TinyUSB/src/class/msc/msc_host.cyclo ./TinyUSB/src/class/msc/msc_host.d ./TinyUSB/src/class/msc/msc_host.o ./TinyUSB/src/class/msc/msc_host.su

.PHONY: clean-TinyUSB-2f-src-2f-class-2f-msc

