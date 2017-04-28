@ECHO OFF

adb reboot-bootloader

ECHO Wait for device to start bootloader

PAUSE

:BOOTLOADER
fastboot devices
ECHO.
SET /p response=Is your device listed above?[y/n]:

IF "%response%" == "y" GOTO MENU
IF "%response%" == "n" GOTO BOOTLOADER

:MENU
cls
ECHO.
ECHO Select a menu item:
ECHO ===============
ECHO.
ECHO 1) Fastboot Check
ECHO 2) Reboot Bootloader
ECHO 3) Flash All (make sure to rename bootloader and radio)
ECHO 4) Flash Bootloader Only
ECHO 5) Flash Radio Only
ECHO 6) Flast boot, recovery, system and vendor Only
ECHO 7) Exit
ECHO.
SET /p response=Select option:
IF "%response%"=="1" GOTO BOOTLOADER
IF "%response%"=="2" fastboot reboot-bootloader
IF "%response%"=="3" GOTO BOOTLOADERCHECK
IF "%response%"=="4" fastboot flash bootloader C:\adb\angler\bootloader-angler.img
IF "%response%"=="5" fastboot flash bootloader C:\adb\angler\radio-angler.img
IF "%response%"=="6" GOTO FLASHTHEREST
IF "%response%"=="7" GOTO CLOSE
GOTO MENU

:BOOTLOADERCHECK
SET /p response=Have you renamed the bootloader image?[y/n]:

IF "%response%" == "y" GOTO RADIOCHECK
IF "%response%" == "n" GOTO NEEDTORENAME

:RADIOCHECK
SET /p response=Have you renamed the radio image?[y/n]:

IF "%response%" == "y" GOTO FINALFLASHCHECK
IF "%response%" == "n" GOTO NEEDTORENAME

:NEEDTORENAME
ECHO Please rename before you continue. Press any key to exit.
PAUSE >nul
EXIT

:FINALFLASHCHECK
SET /p response=Are you sure you want to flash all?[y/n]:

IF "%response%" == "y" GOTO FLASHBOOTLOADER
IF "%response%" == "n" GOTO CLOSE

:FLASHBOOTLOADER
fastboot flash bootloader C:\adb\angler\bootloader-angler.img
fastboot reboot-bootloader
PAUSE
GOTO FIRSTREBOOTCHECK

:FIRSTREBOOTCHECK
fastboot devices
ECHO.
SET /p response=Is your device listed above?[y/n]:

IF "%response%" == "y" GOTO FLASHRADIO
IF "%response%" == "n" GOTO FIRSTREBOOTCHECK

:FLASHRADIO
fastboot flash radio C:\adb\angler\radio-angler.img
fastboot reboot-bootloader
PAUSE
GOTO SECONDREBOOTCHECK

:SECONDREBOOTCHECK
fastboot devices
ECHO.
SET /p response=Is your device listed above?[y/n]:

IF "%response%" == "y" GOTO FLASHTHEREST
IF "%response%" == "n" GOTO SECONDREBOOTCHECK

:FLASHTHEREST
fastboot flash boot C:\adb\angler\boot.img
fastboot erase cache
fastboot flash recovery C:\adb\angler\recovery.img
fastboot flash system C:\adb\angler\system.img
fastboot flash vendor C:\adb\angler\vendor.img
ECHO Update complete.
GOTO CLOSE

:CLOSE
ECHO Press any key to exit...
PAUSE >nul
EXIT