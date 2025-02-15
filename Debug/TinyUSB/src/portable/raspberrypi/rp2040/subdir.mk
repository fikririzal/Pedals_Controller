################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../TinyUSB/src/portable/raspberrypi/rp2040/dcd_rp2040.c \
../TinyUSB/src/portable/raspberrypi/rp2040/hcd_rp2040.c \
../TinyUSB/src/portable/raspberrypi/rp2040/rp2040_usb.c 

OBJS += \
./TinyUSB/src/portable/raspberrypi/rp2040/dcd_rp2040.o \
./TinyUSB/src/portable/raspberrypi/rp2040/hcd_rp2040.o \
./TinyUSB/src/portable/raspberrypi/rp2040/rp2040_usb.o 

C_DEPS += \
./TinyUSB/src/portable/raspberrypi/rp2040/dcd_rp2040.d \
./TinyUSB/src/portable/raspberrypi/rp2040/hcd_rp2040.d \
./TinyUSB/src/portable/raspberrypi/rp2040/rp2040_usb.d 


# Each subdirectory must supply rules for building sources it contributes
TinyUSB/src/portable/raspberrypi/rp2040/%.o TinyUSB/src/portable/raspberrypi/rp2040/%.su TinyUSB/src/portable/raspberrypi/rp2040/%.cyclo: ../TinyUSB/src/portable/raspberrypi/rp2040/%.c TinyUSB/src/portable/raspberrypi/rp2040/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DDEBUG -DSTM32F103xB -DUSE_FULL_LL_DRIVER -DUSE_HAL_DRIVER -c -I../Core/Inc -I../Drivers/STM32F1xx_HAL_Driver/Inc -I../Drivers/CMSIS/Device/ST/STM32F1xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/mines/Downloads/Pedals/Pedals_Controller/TinyUSB/src" -I../Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

clean: clean-TinyUSB-2f-src-2f-portable-2f-raspberrypi-2f-rp2040

clean-TinyUSB-2f-src-2f-portable-2f-raspberrypi-2f-rp2040:
	-$(RM) ./TinyUSB/src/portable/raspberrypi/rp2040/dcd_rp2040.cyclo ./TinyUSB/src/portable/raspberrypi/rp2040/dcd_rp2040.d ./TinyUSB/src/portable/raspberrypi/rp2040/dcd_rp2040.o ./TinyUSB/src/portable/raspberrypi/rp2040/dcd_rp2040.su ./TinyUSB/src/portable/raspberrypi/rp2040/hcd_rp2040.cyclo ./TinyUSB/src/portable/raspberrypi/rp2040/hcd_rp2040.d ./TinyUSB/src/portable/raspberrypi/rp2040/hcd_rp2040.o ./TinyUSB/src/portable/raspberrypi/rp2040/hcd_rp2040.su ./TinyUSB/src/portable/raspberrypi/rp2040/rp2040_usb.cyclo ./TinyUSB/src/portable/raspberrypi/rp2040/rp2040_usb.d ./TinyUSB/src/portable/raspberrypi/rp2040/rp2040_usb.o ./TinyUSB/src/portable/raspberrypi/rp2040/rp2040_usb.su

.PHONY: clean-TinyUSB-2f-src-2f-portable-2f-raspberrypi-2f-rp2040

