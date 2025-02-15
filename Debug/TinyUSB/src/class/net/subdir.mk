################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../TinyUSB/src/class/net/ecm_rndis_device.c \
../TinyUSB/src/class/net/ncm_device.c 

OBJS += \
./TinyUSB/src/class/net/ecm_rndis_device.o \
./TinyUSB/src/class/net/ncm_device.o 

C_DEPS += \
./TinyUSB/src/class/net/ecm_rndis_device.d \
./TinyUSB/src/class/net/ncm_device.d 


# Each subdirectory must supply rules for building sources it contributes
TinyUSB/src/class/net/%.o TinyUSB/src/class/net/%.su TinyUSB/src/class/net/%.cyclo: ../TinyUSB/src/class/net/%.c TinyUSB/src/class/net/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DDEBUG -DSTM32F103xB -DUSE_FULL_LL_DRIVER -DUSE_HAL_DRIVER -c -I../Core/Inc -I../Drivers/STM32F1xx_HAL_Driver/Inc -I../Drivers/CMSIS/Device/ST/STM32F1xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/mines/Downloads/Pedals/Pedals_Controller/TinyUSB/src" -I../Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

clean: clean-TinyUSB-2f-src-2f-class-2f-net

clean-TinyUSB-2f-src-2f-class-2f-net:
	-$(RM) ./TinyUSB/src/class/net/ecm_rndis_device.cyclo ./TinyUSB/src/class/net/ecm_rndis_device.d ./TinyUSB/src/class/net/ecm_rndis_device.o ./TinyUSB/src/class/net/ecm_rndis_device.su ./TinyUSB/src/class/net/ncm_device.cyclo ./TinyUSB/src/class/net/ncm_device.d ./TinyUSB/src/class/net/ncm_device.o ./TinyUSB/src/class/net/ncm_device.su

.PHONY: clean-TinyUSB-2f-src-2f-class-2f-net

