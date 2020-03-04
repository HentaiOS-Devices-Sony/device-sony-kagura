# Copyright 2014 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

include device/sony/tone/PlatformConfig.mk

TARGET_BOOTLOADER_BOARD_NAME := unknown
ifneq (,$(filter %hentai_kagura_RoW,$(TARGET_PRODUCT)))
TARGET_BOOTLOADER_BOARD_NAME := F8331
else ifneq (,$(filter %hentai_kagura_DSDS,$(TARGET_PRODUCT)))
TARGET_BOOTLOADER_BOARD_NAME := F8332
else ifneq (,$(filter %hentai_kagura_DSDS_Go,$(TARGET_PRODUCT)))
TARGET_BOOTLOADER_BOARD_NAME := F8332
else ifneq (,$(filter %hentai_kagura_RoW_Go,$(TARGET_PRODUCT)))
TARGET_BOOTLOADER_BOARD_NAME := F8331
# Reserve space for data encryption (55125737472-16384)
BOARD_USERDATAIMAGE_PARTITION_SIZE := 55125721088
else
TARGET_BOOTLOADER_BOARD_NAME := F8331
$(warning Unrecognized value for TARGET_PRODUCT: "$(TARGET_PRODUCT)", using default value: "$(TARGET_BOOTLOADER_BOARD_NAME)")
endif

# Platform
PRODUCT_PLATFORM := tone

BOARD_KERNEL_CMDLINE += androidboot.hardware=kagura

#Use Clang instead of Gcc 4.9
TARGET_KERNEL_CLANG_COMPILE := true
TARGET_CLANG_VERSION := r353983c

#kernel
BOARD_KERNEL_SEPARATED_DTBO := true
TARGET_COMPILE_WITH_MSM_KERNEL := true
TARGET_KERNEL_SOURCE := kernel/sony/msm-4.9/kernel
TARGET_NEEDS_DTBOIMAGE := false

# Partition information
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_CACHEIMAGE_PARTITION_SIZE := 268435456
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 6197084160
BOARD_ODMIMAGE_PARTITION_SIZE := 419430400
# Reserve space for data encryption (23857201152-16384)
BOARD_USERDATAIMAGE_PARTITION_SIZE := 23857184768

WIFI_BUS := PCIE

# NFC
NXP_CHIP_FW_TYPE := PN547C2

TARGET_USES_CASH_EXTENSION := true

