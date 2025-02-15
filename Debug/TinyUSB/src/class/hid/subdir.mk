################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../TinyUSB/src/class/hid/hid_device.c \
../TinyUSB/src/class/hid/hid_host.c 

OBJS += \
./TinyUSB/src/class/hid/hid_device.o \
./TinyUSB/src/class/hid/hid_host.o 

C_DEPS += \
./TinyUSB/src/class/hid/hid_device.d \
./TinyUSB/src/class/hid/hid_host.d 


# Each subdirectory must supply rules for building sources it contributes
TinyUSB/src/class/hid/%.o TinyUSB/src/class/hid/%.su TinyUSB/src/class/hid/%.cyclo: ../TinyUSB/src/class/hid/%.c TinyUSB/src/class/hid/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DDEBUG -DSTM32F103xB -DUSE_FULL_LL_DRIVER -DUSE_HAL_DRIVER -c -I../Core/Inc -I../Drivers/STM32F1xx_HAL_Driver/Inc -I../Drivers/CMSIS/Device/ST/STM32F1xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/mines/Downloads/Pedals/Pedals_Controller/TinyUSB/src" -I../Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

clean: clean-TinyUSB-2f-src-2f-class-2f-hid

clean-TinyUSB-2f-src-2f-class-2f-hid:
	-$(RM) ./TinyUSB/src/class/hid/hid_device.cyclo ./TinyUSB/src/class/hid/hid_device.d ./TinyUSB/src/class/hid/hid_device.o ./TinyUSB/src/class/hid/hid_device.su ./TinyUSB/src/class/hid/hid_host.cyclo ./TinyUSB/src/class/hid/hid_host.d ./TinyUSB/src/class/hid/hid_host.o ./TinyUSB/src/class/hid/hid_host.su

.PHONY: clean-TinyUSB-2f-src-2f-class-2f-hid

