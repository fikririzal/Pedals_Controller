################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../TinyUSB/src/host/hub.c \
../TinyUSB/src/host/usbh.c 

OBJS += \
./TinyUSB/src/host/hub.o \
./TinyUSB/src/host/usbh.o 

C_DEPS += \
./TinyUSB/src/host/hub.d \
./TinyUSB/src/host/usbh.d 


# Each subdirectory must supply rules for building sources it contributes
TinyUSB/src/host/%.o TinyUSB/src/host/%.su TinyUSB/src/host/%.cyclo: ../TinyUSB/src/host/%.c TinyUSB/src/host/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DDEBUG -DSTM32F103xB -DUSE_FULL_LL_DRIVER -DUSE_HAL_DRIVER -c -I../Core/Inc -I../Drivers/STM32F1xx_HAL_Driver/Inc -I../Drivers/CMSIS/Device/ST/STM32F1xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/mines/Downloads/Pedals/Pedals_Controller/TinyUSB/src" -I../Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

clean: clean-TinyUSB-2f-src-2f-host

clean-TinyUSB-2f-src-2f-host:
	-$(RM) ./TinyUSB/src/host/hub.cyclo ./TinyUSB/src/host/hub.d ./TinyUSB/src/host/hub.o ./TinyUSB/src/host/hub.su ./TinyUSB/src/host/usbh.cyclo ./TinyUSB/src/host/usbh.d ./TinyUSB/src/host/usbh.o ./TinyUSB/src/host/usbh.su

.PHONY: clean-TinyUSB-2f-src-2f-host

