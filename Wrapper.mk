# @file Wrapper.mk
# @version 1.0
#
# @section License
# Copyright (C) 2018, Mikael Patel
#
# This library is free software; you can redistribute it and/or
# modify it under the terms of the GNU Lesser General Public
# License as published by the Free Software Foundation; either
# version 2.1 of the License, or (at your option) any later version.
#
# This library is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# Lesser General Public License for more details.
#
# @section Description
# Arduino-Makefile wrapper for command-line build without make file.

ifndef ARDUINO_VER
  ARDUINO_VER = 1.8.8
endif
ifndef ARDUINO_DIR
  ARDUINO_DIR = $(HOME)/opt/arduino-$(ARDUINO_VER)
endif

ARDUINO_AVR_DIR = $(ARDUINO_DIR)/hardware/arduino/avr
ARDUINO_CORE_PATH = $(ARDUINO_AVR_DIR)/cores/arduino
ARDUINO_VAR_PATH = $(ARDUINO_AVR_DIR)/variants

OBJDIR = $(SKETCHBOOK_DIR)/obj/build-$(ARDUINO_VER)/$(BOARD_TAG)/$(TARGET)

MONITOR_CMD = $(ARDMK_DIR)/bin/miniterm.py -q --lf
ARD_UTIL = $(ARDMK_DIR)/bin/ard-util.py
BOARDS_TXT = $(ARDUINO_AVR_DIR)/boards.txt

ifeq ($(BOARD),mega)
  BOARD_TAG = mega
  BOARD_SUB = atmega2560
else ifeq ($(BOARD),mega-1280)
  BOARD_TAG = mega
  BOARD_SUB = atmega1280
else ifeq ($(BOARD),diecimila)
  BOARD_TAG = diecimila
  BOARD_SUB = atmega328
else ifeq ($(BOARD),diecimila-168)
  BOARD_TAG = diecimila
  BOARD_SUB = atmega168
else ifeq ($(BOARD),nano)
  BOARD_TAG = nano
  BOARD_SUB = atmega328
else ifeq ($(BOARD),mini)
  BOARD_TAG = mini
  BOARD_SUB = atmega328
else ifeq ($(BOARD),mini-168)
  BOARD_TAG = mini
  BOARD_SUB = atmega168
else
  BOARD_TAG = $(BOARD)
endif

include $(ARDMK_DIR)/Arduino.mk
