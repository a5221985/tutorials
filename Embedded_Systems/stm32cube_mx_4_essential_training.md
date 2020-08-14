# STM32CubeMX 4 Essential Training #
## Introduction ##
### Introduction ###
1. Graphical tool
2. Standalone app or plugin
3. We can select uc board and configure peripheral, clock trees using GUIs
4. We can calculate power consumption
5. We can generate C code for popular uc development ides Kiel u vision, IAR embedded embedded workbench and eclipse

### Setting Up STM32CubeMX ###
1. Download
	1. www.st.com/st32cubemx
2. Put name and email address
3. Sends download link to email
4. Click link in email
5. uncompress the zip file
6. Double click to install
7. Double click icon
8. New project
	1. STM32F0
	2. STM32Fx1
	3. LQFP100
	4. Or
		1. Board selector
			1. Board type: Discovery
			2. MCU Series: STM32F4
			3. Select the board from the list
			4. Ok
	5. Pinout configuration is shown

### Overview of STM32CubeMX ###
1. File menu
2. Project
	1. Generate Code
	2. Generate Report - PDF
		1. Pinout and config
	3. Settings
		1. For code generation
		2. Tool chain:
			1. Tool selection
		3. Project name
		4. Project location
3. Window
	1. Active output or disable
4. Help
	1. Check for updates
	2. Install new libraries
	3. Update settings
5. Toolbar:
	1. Generate code
	2. Generate csv file of pinout
	3. save
	4. ...
6. Pinout > Clear pinout
	1. PD15 - set it as GPIO output pin
	2. PD14 - set it as GPIO output pin
	3. PD13 - set it as GPIO output pin
	4. PD12 - set it as GPIO output pin
7. Click on SYS (on left side)
	1. Click Debug
		1. Serial Wire
8. Select RCC
	1. High speed clock: CrystalCeramic...
9. Code genration:
	1. Project name: Blinky
	2. Select location
	3. Toolchain:
		1. MDK-ARM V5
	4. Code genrator:
		1. Copy all used libarries into the project folder
		2. Keep defaults
	5. Advanced Settings: Default
	6. OK
10. Open Folder
	1. To change settings: Double click Blinky.ioc
11. Generate report
	1. Double click the Blinky.pdf
		1. Clock settings
		2. Pin diagrams
12. Open Kiel u Vision
13. Code:
	1. Just write the logic to blink the leds

### Overview of STM32CubeMX (continued) ###
1. Click on rebuild
2. Right click on MX_GPIO_Init();
	1. Go to definition
		1. ...
3. Main.c

		while (1)
		{
			HAL_GPIO_WritePin(GPIOD, PIN_12, 1);
		}
		
	1. Click on Function tab on left side to get the API definitions
	2. Rebuild and download onto board

### Checking for Updates and Firmwares ###
1. Help > Checl for Updates
	1. Check
	2. Install now
	3. Check for more updates
2. Help > Install new libraries
	1. Check other libraries and install
	2. Or check and remove

### Clock Tree Configuration ###
1. Click configuration (tab)
	1. HCLK - 96 to 100
		1. Other clocks are automatically set
	2. We can set sub-clocks as well
2. Initialization of Real-Time Clock
	1. RTC
		1. Activate Clock Source
		2. Activate Calendar
		3. Alarm A - Internal Alarm
		4. Alarm B - Internal Alarm
	2. Clock tree:
		1. LSI
3. Middle value - system level frequency
4. Clock source:
	1. HSI (High Speed Internal) - high (16 is default)
	2. HSE (High Speed External)
	3. PLLCLK (chosen when others cannot provide the speed entered)

### The Configuration Tab ###
1. Select Configuration tab
	1. Peripherals changed are arranged in different groups
		1. GPIO selected
			1. Choices available
	2. ADCs not chosen
	3. No middleware
2. We can enable
	1. Freertos
	2. FATFS
3. Peripherals
	1. Enabled
		1. We can select parameters using GUI (instead of code)

## General Purpose Input/ Output (GPIO) Projects ##
### Input/ Output ###
1. Right click on the pin (PA5) and select Enter
	1. Green
2. Right click on the pin (PA13) and selet Enter
	1. Button 
3. SYS (for programming uc)
	1. Serial Wire (user button but cannot use as wakeup button due to conflict)
4. Choose folder and Project name: Input_Output
5. Toolchain: Arm V5
6. Ok (generates code)
7. Open project (in Kiel)
8. Rebuild the project
9. Right click and go to definition
10. (Kiel uVision) Click functions > GPIO Module > HAL_GPIO_ReadPin... (double click)
11. Code:

		while (1)
		{
			/* USER CODE END WHILE */
			buttonStatus = HAL_GPIO_ReadPin(GPIOC, BUTTON_GPIO_Port);
			/* USER CODE BEGIN 3 */
			HAL_GPIO_WritePin(GPIOA, GPIO_PIN_5, buttonStatus);
		}

### Input Interrupt ###
1. Interrupt lines - Reference manual
	1. Keil uVision
		1. Books
			1. 198: PA0 - Interrupt
				1. Push button: PA0 - external interrupt line 0
					1. PB0
					2. PC0
					3. ...
2. New project:
	1. STM32 Discover Board
	2. Clear pin out
	3. PA0 - GPIO_EXTIO
	4. PD13 - GPIO_Output
	5. PD12 - GPIO_Output
	6. SYS
		1. Debug:
			1. Serial Wire
	7. GUI
		1. Click NVIC
		2. Tick EXTI Line 0
	8. Generate code:
		1. Name: External_Interrupt
		2. MDK-ARM-5
	9. Open project in Keil
	10. Code:

			while (1) {
				HAL_GPIO_WritePin(GPIOD, GPIO_PIN_13, 1);
			}
			
		1. Open `stm32f4xx_hal_gpio.c` and copy the function (`__weak` means it can be redefined)

				__weak void HAL_GPIO_EXTI_Callback(...)
				
			1. Change to:

					void HAL_GPIO_EXTI_Callback(uint16_t GPIO_Pin)
					{
						/* Prevent unused argument(s) compilation warning */
						UNUSED(GPIO_Pin);
						/* NOTE: This function should not be modified, when the callback is needed,
									the HAL_GPIO_EXTI_Callback could be implemented in the user file
						*/
						HAL_GPIO_WritePin(GPIOD, GPIO_PIN_13, 1);
					}

## Constructing TIMER (TIM) Projects ##
### Basic Delay TIMER ###
1. Used for accurate delays
2. New project > STM32 Discover
3. Clear Pinouts
4. Select TIM2
	1. Clock Source: Internal clock
5. PD13: GPIO_Output
6. Configuration tab:
	1. Control
		1. Prescalar: 48000 (1 ms)
		2. Counter Period: 1000 (1 s)
		3. Trigger Event Selection: Update Event
			1. To keep it updating and going on and on
		4. NVIC Settings:
			1. TIM2 global interrupt: Tick
	2. Generate code:
		1. Name: DelayS
		2. MKD+ARM V5
	3. Open project in Keil
	4. Rebuild
		1. Debug:
			1. Settings:
				1. Run Download:
					1. Reset and Run (don't have to press reset button when new code is loaded)
	5. Code:
	
			MX_TIM2_Init();
			
			HAL_TIME_Base_Start_IT(&htim2); // starts timer
			...
			
			void HAL_TIM_PeriodElapsedCallback(TIM_HandleTypeDef *htim)
			{
				UNUSED(htim);
				
				HAL_GPIO_TogglePin(GPIOD, GPIO_PIN_13);
			}

### Output Compare Timer ###
1. Output Compare: Trigger output based on a particular timestamp
	1. Output Compare interrupt (hardware interrupt)
		1. Red - 50 ms
		2. Orange - 30 ms
		3. Green - 100 ms
2. New project in CubeMX
	1. STM32 Discover
	2. Clear Pinouts
	3. PD12 - TIM4_CH1
	4. PD13 - TIM4_CH2
	5. PD14 - TIM4_CH3
	6. PD15 - TIM4_CH4

### Input CaptureTimer ###

## Analog-to-Digital Conversion (ADC) ##
### Single Mode Conversion ###
### Notice ###
### Continuous Mode Conversion ###
### Timer Triggered Conversion ###
### ADC Multi-Channel DMA Scan Mode ###

## Serial Peripheral Interface (SPI) ##
### Introduction to SPI ###
### SPI Configuration Part I ###
### Notice ###
### SPI Configuration Part II ###
### Reading the Gyroscope Data ###

## Digital to Analog Converter (DAC) ##
### Configuring the DAC ###

## Universal Asynchronous Receiver-Transmitter (UART) ##
### Configuring the UART ###

## Pulse Width Modulation (PWM) ##
### Configuring the PWM (Part I) ###
### Configuring the PWM (Part II) ###