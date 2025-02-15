/* USER CODE BEGIN Header */
/**
 ******************************************************************************
 * @file           : main.c
 * @brief          : Main program body
 ******************************************************************************
 * @attention
 *
 * Copyright (c) 2025 STMicroelectronics.
 * All rights reserved.
 *
 * This software is licensed under terms that can be found in the LICENSE file
 * in the root directory of this software component.
 * If no LICENSE file comes with this software, it is provided AS-IS.
 *
 ******************************************************************************
 */
/* USER CODE END Header */
/* Includes ------------------------------------------------------------------*/
#include "main.h"

/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <ctype.h>
#include <stdbool.h>

#include "tusb.h"
#include "tusb_config.h"
//#include "tusb_types.h"
#include "usb_descriptors.h"

/* USER CODE END Includes */

/* Private typedef -----------------------------------------------------------*/
/* USER CODE BEGIN PTD */

/* USER CODE END PTD */

/* Private define ------------------------------------------------------------*/
/* USER CODE BEGIN PD */

/* USER CODE END PD */

/* Private macro -------------------------------------------------------------*/
/* USER CODE BEGIN PM */
enum {
	ITF_KEYBOARD = 0, ITF_MOUSE = 1
};

/* Blink pattern
 * - 250 ms  : device not mounted
 * - 1000 ms : device mounted
 * - 2500 ms : device is suspended
 */
enum {
	BLINK_NOT_MOUNTED = 100, BLINK_MOUNTED = 500, BLINK_SUSPENDED = 250,
};

/* USER CODE END PM */

/* Private variables ---------------------------------------------------------*/
PCD_HandleTypeDef hpcd_USB_FS;

/* USER CODE BEGIN PV */
static uint32_t blink_interval_ms = BLINK_NOT_MOUNTED;
// Buffer to store the serial ID as a string
char serial_str[26]; // 24 chars + null terminator
/* USER CODE END PV */

/* Private function prototypes -----------------------------------------------*/
void SystemClock_Config(void);
static void MX_GPIO_Init(void);
static void MX_USB_PCD_Init(void);
/* USER CODE BEGIN PFP */
static void echo_serial_port(uint8_t itf, uint8_t buf[], uint32_t count);
static void cdc_task(void);
void led_blinking_task(void);
void hid_task(void);
void get_serial_id_string(void);
void LL_USB_InitPeriph(void);
/* USER CODE END PFP */

/* Private user code ---------------------------------------------------------*/
/* USER CODE BEGIN 0 */

int _write(int le, char *ptr, int len)
{
	for (int DataIdx = 0; DataIdx < len; DataIdx++)
	{
		ITM_SendChar(*ptr++);
	}
	return len;
}

/* USER CODE END 0 */

/**
  * @brief  The application entry point.
  * @retval int
  */
int main(void)
{

  /* USER CODE BEGIN 1 */

  /* USER CODE END 1 */

  /* MCU Configuration--------------------------------------------------------*/

  /* Reset of all peripherals, Initializes the Flash interface and the Systick. */
  HAL_Init();

  /* USER CODE BEGIN Init */

  /* USER CODE END Init */

  /* Configure the system clock */
  SystemClock_Config();


  /* USER CODE BEGIN SysInit */

  /* USER CODE END SysInit */

  /* Initialize all configured peripherals */
  MX_GPIO_Init();
  MX_USB_PCD_Init();
  /* USER CODE BEGIN 2 */
	tusb_rhport_init_t dev_init = { .role = TUSB_ROLE_DEVICE, .speed =
			TUSB_SPEED_AUTO };
//  LL_USB_InitPeriph();
  get_serial_id_string();
	tusb_init(BOARD_TUD_RHPORT, &dev_init);

  /* USER CODE END 2 */

  /* Infinite loop */
  /* USER CODE BEGIN WHILE */
	printf(serial_str);
	while (1) {
		tud_task();
		cdc_task();
		led_blinking_task();
		hid_task();
    /* USER CODE END WHILE */

    /* USER CODE BEGIN 3 */
	}
  /* USER CODE END 3 */
}

/**
  * @brief System Clock Configuration
  * @retval None
  */
void SystemClock_Config(void)
{
  RCC_OscInitTypeDef RCC_OscInitStruct = {0};
  RCC_ClkInitTypeDef RCC_ClkInitStruct = {0};
  RCC_PeriphCLKInitTypeDef PeriphClkInit = {0};

  /** Initializes the RCC Oscillators according to the specified parameters
  * in the RCC_OscInitTypeDef structure.
  */
  RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_HSE;
  RCC_OscInitStruct.HSEState = RCC_HSE_ON;
  RCC_OscInitStruct.HSEPredivValue = RCC_HSE_PREDIV_DIV1;
  RCC_OscInitStruct.HSIState = RCC_HSI_ON;
  RCC_OscInitStruct.PLL.PLLState = RCC_PLL_ON;
  RCC_OscInitStruct.PLL.PLLSource = RCC_PLLSOURCE_HSE;
  RCC_OscInitStruct.PLL.PLLMUL = RCC_PLL_MUL9;
  if (HAL_RCC_OscConfig(&RCC_OscInitStruct) != HAL_OK)
  {
    Error_Handler();
  }

  /** Initializes the CPU, AHB and APB buses clocks
  */
  RCC_ClkInitStruct.ClockType = RCC_CLOCKTYPE_HCLK|RCC_CLOCKTYPE_SYSCLK
                              |RCC_CLOCKTYPE_PCLK1|RCC_CLOCKTYPE_PCLK2;
  RCC_ClkInitStruct.SYSCLKSource = RCC_SYSCLKSOURCE_PLLCLK;
  RCC_ClkInitStruct.AHBCLKDivider = RCC_SYSCLK_DIV1;
  RCC_ClkInitStruct.APB1CLKDivider = RCC_HCLK_DIV2;
  RCC_ClkInitStruct.APB2CLKDivider = RCC_HCLK_DIV1;

  if (HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_2) != HAL_OK)
  {
    Error_Handler();
  }
  PeriphClkInit.PeriphClockSelection = RCC_PERIPHCLK_USB;
  PeriphClkInit.UsbClockSelection = RCC_USBCLKSOURCE_PLL_DIV1_5;
  if (HAL_RCCEx_PeriphCLKConfig(&PeriphClkInit) != HAL_OK)
  {
    Error_Handler();
  }
}

/**
  * @brief USB Initialization Function
  * @param None
  * @retval None
  */
static void MX_USB_PCD_Init(void)
{

  /* USER CODE BEGIN USB_Init 0 */

  /* USER CODE END USB_Init 0 */

  /* USER CODE BEGIN USB_Init 1 */

  /* USER CODE END USB_Init 1 */
  hpcd_USB_FS.Instance = USB;
  hpcd_USB_FS.Init.dev_endpoints = 8;
  hpcd_USB_FS.Init.speed = PCD_SPEED_FULL;
  hpcd_USB_FS.Init.low_power_enable = DISABLE;
  hpcd_USB_FS.Init.lpm_enable = DISABLE;
  hpcd_USB_FS.Init.battery_charging_enable = DISABLE;
  if (HAL_PCD_Init(&hpcd_USB_FS) != HAL_OK)
  {
    Error_Handler();
  }
  /* USER CODE BEGIN USB_Init 2 */

  /* USER CODE END USB_Init 2 */

}

/**
  * @brief GPIO Initialization Function
  * @param None
  * @retval None
  */
static void MX_GPIO_Init(void)
{
  LL_GPIO_InitTypeDef GPIO_InitStruct = {0};
/* USER CODE BEGIN MX_GPIO_Init_1 */
/* USER CODE END MX_GPIO_Init_1 */

  /* GPIO Ports Clock Enable */
  LL_APB2_GRP1_EnableClock(LL_APB2_GRP1_PERIPH_GPIOC);
  LL_APB2_GRP1_EnableClock(LL_APB2_GRP1_PERIPH_GPIOD);
  LL_APB2_GRP1_EnableClock(LL_APB2_GRP1_PERIPH_GPIOA);
  LL_APB2_GRP1_EnableClock(LL_APB2_GRP1_PERIPH_GPIOB);

  /**/
  LL_GPIO_ResetOutputPin(userLED_GPIO_Port, userLED_Pin);

  /**/
  LL_GPIO_ResetOutputPin(GPIOA, Clutch_Clock_Pin|Brake_Clock_Pin|Throttle_Clock_Pin);

  /**/
  GPIO_InitStruct.Pin = userLED_Pin;
  GPIO_InitStruct.Mode = LL_GPIO_MODE_OUTPUT;
  GPIO_InitStruct.Speed = LL_GPIO_SPEED_FREQ_HIGH;
  GPIO_InitStruct.OutputType = LL_GPIO_OUTPUT_PUSHPULL;
  GPIO_InitStruct.Pull = LL_GPIO_PULL_UP;
  LL_GPIO_Init(userLED_GPIO_Port, &GPIO_InitStruct);

  /**/
  GPIO_InitStruct.Pin = Clutch_Clock_Pin|Brake_Clock_Pin|Throttle_Clock_Pin;
  GPIO_InitStruct.Mode = LL_GPIO_MODE_OUTPUT;
  GPIO_InitStruct.Speed = LL_GPIO_SPEED_FREQ_LOW;
  GPIO_InitStruct.OutputType = LL_GPIO_OUTPUT_PUSHPULL;
  LL_GPIO_Init(GPIOA, &GPIO_InitStruct);

  /**/
  GPIO_InitStruct.Pin = Clutch_Data_Pin|Brake_Data_Pin|Throttle_Data_Pin;
  GPIO_InitStruct.Mode = LL_GPIO_MODE_FLOATING;
  LL_GPIO_Init(GPIOA, &GPIO_InitStruct);

/* USER CODE BEGIN MX_GPIO_Init_2 */
/* USER CODE END MX_GPIO_Init_2 */
}

/* USER CODE BEGIN 4 */
// echo to either Serial0 or Serial1
// with Serial0 as all lower case, Serial1 as all upper case
static void echo_serial_port(uint8_t itf, uint8_t buf[], uint32_t count) {
	for (uint32_t i = 0; i < count; i++) {
		if (itf == 0) {
			// echo back 1st port as lower case
			if (isupper(buf[i]))
				buf[i] += 'a' - 'A';
		} else {
			// echo back 2nd port as upper case
			if (islower(buf[i]))
				buf[i] -= 'a' - 'A';
		}

		tud_cdc_n_write_char(itf, buf[i]);
	}
	tud_cdc_n_write_flush(itf);
}

//--------------------------------------------------------------------+
// USB CDC
//--------------------------------------------------------------------+
static void cdc_task(void) {
	uint8_t itf;

	for (itf = 0; itf < CFG_TUD_CDC; itf++) {
		// connected() check for DTR bit
		// Most but not all terminal client set this when making connection
		// if ( tud_cdc_n_connected(itf) )
		{
			if (tud_cdc_n_available(itf)) {
				uint8_t buf[64];

				uint32_t count = tud_cdc_n_read(itf, buf, sizeof(buf));

				// echo back to both serial ports
				echo_serial_port(0, buf, count);
//        echo_serial_port(1, buf, count);
			}
		}
	}
}

// Invoked when device is mounted
void tud_mount_cb(void) {
	blink_interval_ms = BLINK_MOUNTED;
}

// Invoked when device is unmounted
void tud_umount_cb(void) {
	blink_interval_ms = BLINK_NOT_MOUNTED;
}

// Invoked when usb bus is suspended
// remote_wakeup_en : if host allow us  to perform remote wakeup
// Within 7ms, device must draw an average of current less than 2.5 mA from bus
void tud_suspend_cb(bool remote_wakeup_en) {
	(void) remote_wakeup_en;
	blink_interval_ms = BLINK_SUSPENDED;
}

// Invoked when usb bus is resumed
void tud_resume_cb(void) {
	blink_interval_ms = tud_mounted() ? BLINK_MOUNTED : BLINK_NOT_MOUNTED;
}

//--------------------------------------------------------------------+
// USB HID
//--------------------------------------------------------------------+

void hid_task(void) {
	// Poll every 10ms
	const uint32_t interval_ms = 10;
	static uint32_t start_ms = 0;

	if (HAL_GetTick() - start_ms < interval_ms)
		return; // not enough time
	start_ms += interval_ms;

	uint32_t const btn = 0;

	// Remote wakeup
	if (tud_suspended() && btn) {
		// Wake up host if we are in suspend mode
		// and REMOTE_WAKEUP feature is enabled by host
		tud_remote_wakeup();
	}

	/*------------- Keyboard -------------*/
	if (tud_hid_n_ready(ITF_KEYBOARD)) {
		// use to avoid send multiple consecutive zero report for keyboard
		static bool has_key = false;

		if (btn) {
			uint8_t keycode[6] = { 0 };
			keycode[0] = HID_KEY_A;

			tud_hid_n_keyboard_report(ITF_KEYBOARD, 0, 0, keycode);

			has_key = true;
		} else {
			// send empty key report if previously has key pressed
			if (has_key)
				tud_hid_n_keyboard_report(ITF_KEYBOARD, 0, 0, NULL);
			has_key = false;
		}
	}

	/*------------- Mouse -------------*/
	if (tud_hid_n_ready(ITF_MOUSE)) {
		if (btn) {
			int8_t const delta = 5;

			// no button, right + down, no scroll pan
			tud_hid_n_mouse_report(ITF_MOUSE, 0, 0x00, delta, delta, 0, 0);
		}
	}
}

// Invoked when received GET_REPORT control request
// Application must fill buffer report's content and return its length.
// Return zero will cause the stack to STALL request
uint16_t tud_hid_get_report_cb(uint8_t itf, uint8_t report_id,
		hid_report_type_t report_type, uint8_t *buffer, uint16_t reqlen) {
	// TODO not Implemented
	(void) itf;
	(void) report_id;
	(void) report_type;
	(void) buffer;
	(void) reqlen;

	return 0;
}

// Invoked when received SET_REPORT control request or
// received data on OUT endpoint ( Report ID = 0, Type = 0 )
void tud_hid_set_report_cb(uint8_t itf, uint8_t report_id,
		hid_report_type_t report_type, uint8_t const *buffer, uint16_t bufsize) {
	// TODO set LED based on CAPLOCK, NUMLOCK etc...
	(void) itf;
	(void) report_id;
	(void) report_type;
	(void) buffer;
	(void) bufsize;
}

// Convert Serial ID to String
void get_serial_id_string(void) {
	unsigned int id1 = HAL_GetUIDw0();
	unsigned int id2 = HAL_GetUIDw1();
	unsigned int id3 = HAL_GetUIDw2();

	// Format: XXXXXXXXYYYYYYYYZZZZZZZZ (Hex format)
	snprintf(serial_str, sizeof(serial_str), "%08X%08X%08X\n", id1, id2, id3);
}

//--------------------------------------------------------------------+
// BLINKING TASK
//--------------------------------------------------------------------+
void led_blinking_task(void) {
	static uint32_t start_ms = 0;
//  static bool led_state = false;

	// Blink every interval ms
	if (HAL_GetTick() - start_ms < blink_interval_ms)
		return; // not enough time
	start_ms += blink_interval_ms;

//  board_led_write(led_state);
	LL_GPIO_TogglePin(userLED_GPIO_Port, userLED_Pin);
//  led_state = 1 - led_state; // toggle
}

void LL_USB_InitPeriph(void) // hand-made function
{
	LL_RCC_SetUSBClockSource(LL_RCC_USB_CLKSOURCE_PLL_DIV_1_5);
	LL_APB1_GRP1_EnableClock(LL_APB1_GRP1_PERIPH_USB);

	LL_APB2_GRP1_EnableClock(LL_APB2_GRP1_PERIPH_GPIOA);

	LL_GPIO_InitTypeDef GPIO_InitStruct = { 0 };
	GPIO_InitStruct.Pin = USB_DM_Pin | USB_DP_Pin;
	GPIO_InitStruct.Mode = LL_GPIO_MODE_ALTERNATE;
	GPIO_InitStruct.Speed = LL_GPIO_SPEED_FREQ_HIGH;
	LL_GPIO_Init(USB_DM_GPIO_Port, &GPIO_InitStruct);

	NVIC_SetPriority(USB_HP_CAN1_TX_IRQn,
			NVIC_EncodePriority(NVIC_GetPriorityGrouping(), 0, 0));
	NVIC_SetPriority(USB_LP_CAN1_RX0_IRQn,
			NVIC_EncodePriority(NVIC_GetPriorityGrouping(), 1, 0));

	NVIC_EnableIRQ(USB_HP_CAN1_TX_IRQn);
	NVIC_EnableIRQ(USB_LP_CAN1_RX0_IRQn);
}

/* USER CODE END 4 */

/**
  * @brief  This function is executed in case of error occurrence.
  * @retval None
  */
void Error_Handler(void)
{
  /* USER CODE BEGIN Error_Handler_Debug */
	/* User can add his own implementation to report the HAL error return state */
	__disable_irq();
	while (1) {
	}
  /* USER CODE END Error_Handler_Debug */
}

#ifdef  USE_FULL_ASSERT
/**
  * @brief  Reports the name of the source file and the source line number
  *         where the assert_param error has occurred.
  * @param  file: pointer to the source file name
  * @param  line: assert_param error line source number
  * @retval None
  */
void assert_failed(uint8_t *file, uint32_t line)
{
  /* USER CODE BEGIN 6 */
  /* User can add his own implementation to report the file name and line number,
     ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */
  /* USER CODE END 6 */
}
#endif /* USE_FULL_ASSERT */
