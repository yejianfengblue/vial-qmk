# Wildcard to allow APM32 MCU
DFU_SUFFIX_ARGS = -p FFFF -v FFFF

CUSTOM_MATRIX = lite

# project specific files
SRC += matrix.c
UART_DRIVER_REQUIRED = yes
