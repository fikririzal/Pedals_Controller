################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../TinyUSB/src/device/usbd.c \
../TinyUSB/src/device/usbd_control.c 

OBJS += \
./TinyUSB/src/device/usbd.o \
./TinyUSB/src/device/usbd_control.o 

C_DEPS += \
./TinyUSB/src/device/usbd.d \
./TinyUSB/src/device/usbd_control.d 


# Each subdirectory must supply rules for building sources it contributes
TinyUSB/src/device/%.o TinyUSB/src/device/%.su TinyUSB/src/device/%.cyclo: ../TinyUSB/src/device/%.c TinyUSB/src/device/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DDEBUG -DSTM32F103xB -DUSE_FULL_LL_DRIVER -DUSE_HAL_DRIVER -c -I../Core/Inc -I../Drivers/STM32F1xx_HAL_Driver/Inc -I../Drivers/CMSIS/Device/ST/STM32F1xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/mines/Downloads/Pedals/Pedals_Controller/TinyUSB/src" -I../Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

clean: clean-TinyUSB-2f-src-2f-device

clean-TinyUSB-2f-src-2f-device:
	-$(RM) ./TinyUSB/src/device/usbd.cyclo ./TinyUSB/src/device/usbd.d ./TinyUSB/src/device/usbd.o ./TinyUSB/src/device/usbd.su ./TinyUSB/src/device/usbd_control.cyclo ./TinyUSB/src/device/usbd_control.d ./TinyUSB/src/device/usbd_control.o ./TinyUSB/src/device/usbd_control.su

.PHONY: clean-TinyUSB-2f-src-2f-device

