echo off
:gui
chcp 65001
set version=1.3
set vrs=%version%
cls
title Monar Launcher V%vrs% / GUI
echo off
cls
echo.
echo		    ███╗   ███╗ █████╗ ███╗  ██╗ █████╗ ██████╗ 
echo		    ████╗ ████║██╔══██╗████╗ ██║██╔══██╗██╔══██╗
echo		    ██╔████╔██║██║  ██║██╔██╗██║███████║██████╔╝
echo		    ██║╚██╔╝██║██║  ██║██║╚████║██╔══██║██╔══██╗
echo		    ██║ ╚═╝ ██║╚█████╔╝██║ ╚███║██║  ██║██║  ██║
echo	       	    ╚═╝     ╚═╝ ╚════╝ ╚═╝  ╚══╝╚═╝  ╚═╝╚═╝  ╚═╝
echo.
echo				1) Launcher
echo				2) Addons
echo                         3) TroubleShoot
echo.
set /p op=Option:
if "%op%"=="1" goto launcher
if "%op%"=="2" goto addonz
if "%op%"=="3" goto cokcheck

echo Please enter a valid option & timeout /t 1 >nul & goto gui
goto gui

:addonz
title Monar Launcher V%vrs% / Addons
cls
echo.
echo		    ███╗   ███╗ █████╗ ███╗  ██╗ █████╗ ██████╗ 
echo		    ████╗ ████║██╔══██╗████╗ ██║██╔══██╗██╔══██╗
echo		    ██╔████╔██║██║  ██║██╔██╗██║███████║██████╔╝
echo		    ██║╚██╔╝██║██║  ██║██║╚████║██╔══██║██╔══██╗
echo		    ██║ ╚═╝ ██║╚█████╔╝██║ ╚███║██║  ██║██║  ██║
echo	       	    ╚═╝     ╚═╝ ╚════╝ ╚═╝  ╚══╝╚═╝  ╚═╝╚═╝  ╚═╝
echo.
echo				1) LCProxy
echo				0) Back
set /p opititi=Option:
if "%opititi%"=="0" goto gui
if "%opititi%"=="1" goto lcproxy

:lcproxy
title Monar Launcher V%vrs% / Addons / LCProxy
cls
echo.
echo		    ███╗   ███╗ █████╗ ███╗  ██╗ █████╗ ██████╗ 
echo		    ████╗ ████║██╔══██╗████╗ ██║██╔══██╗██╔══██╗
echo		    ██╔████╔██║██║  ██║██╔██╗██║███████║██████╔╝
echo		    ██║╚██╔╝██║██║  ██║██║╚████║██╔══██║██╔══██╗
echo		    ██║ ╚═╝ ██║╚█████╔╝██║ ╚███║██║  ██║██║  ██║
echo	       	    ╚═╝     ╚═╝ ╚════╝ ╚═╝  ╚══╝╚═╝  ╚═╝╚═╝  ╚═╝
echo.
echo				1) Install
echo				2) Uninstall
echo                         0) Back
set /p opitk=Option:
if "%opitk%"=="0" goto gui
if "%opitk%"=="1" goto basic
if "%opitk%"=="2" goto uninstall




:launcher
cls
if "%PROCESSOR_ARCHITECTURE%" EQU "amd64" (
>nul 2>&1 "%SYSTEMROOT%\SysWOW64\cacls.exe" "%SYSTEMROOT%\SysWOW64\config\system"
) ELSE (
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
)

if '%errorlevel%' NEQ '0' (
goto gudneis
) else ( goto adminerr )
cls
:adminerr
echo Please Open Monar As normally 
echo Dont Open Monar as Administrator.
ping localhost -n 5.5 >nul
exit

:gudneis
title Monar Launcher V%vrs% / Launcher Menu
echo.
echo		    ███╗   ███╗ █████╗ ███╗  ██╗ █████╗ ██████╗ 
echo		    ████╗ ████║██╔══██╗████╗ ██║██╔══██╗██╔══██╗
echo		    ██╔████╔██║██║  ██║██╔██╗██║███████║██████╔╝
echo		    ██║╚██╔╝██║██║  ██║██║╚████║██╔══██║██╔══██╗
echo		    ██║ ╚═╝ ██║╚█████╔╝██║ ╚███║██║  ██║██║  ██║
echo	       	    ╚═╝     ╚═╝ ╚════╝ ╚═╝  ╚══╝╚═╝  ╚═╝╚═╝  ╚═╝  
echo.
echo                  REMEMBER TO SETUP YOUR PATH!
echo                       Select a Version:
echo			      1) 1.7
echo			      2) 1.8
echo			      3) 1.12
echo			      4) 1.16
echo			      5) 1.17
echo			      6) 1.18
echo                       7) 1.19
echo			      0) Back
echo. 
set /p verop=Version:
if "%verop%"=="1" goto 1.7
if "%verop%"=="2" goto 1.8
if "%verop%"=="3" goto 1.12
if "%verop%"=="4" goto 1.16
if "%verop%"=="5" goto 1.17
if "%verop%"=="6" goto 1.18
if "%verop%"=="7" goto 1.19
if "%verop%"=="0" goto gui 

echo Please enter a valid option & timeout /t 1 >nul & goto launcher
goto installcp


:1.7
cls
echo Creating Process...
ping localhost -n 3.5 >nul
set Args=-Xms3G -Xmx3G -Xmn1G -XX:+UnlockExperimentalVMOptions -XX:+UseG1GC -XX:G1NewSizePercent=20 -XX:G1ReservePercent=20 -XX:MaxGCPauseMillis=50 -XX:G1HeapRegionSize=32M
for /f "delims=" %%x in (files\path.txt) do set pather=%%x
set reDevil=%pather%\files\natives\1.7-1.12

IF EXIST "files\lunarpath.txt" (
    for /f "delims=" %%c in (files\lunarpath.txt) do set scd=%%c
) ELSE (
    set scd=%userprofile%\.lunarclient
)

cd %scd%\offline\multiver
for /D %%I in ("%pather%\files\jre\1.7-1.19\zulu*") do start "Monar Debug" %%~I\bin\javaw.exe --add-modules jdk.naming.dns --add-exports jdk.naming.dns/com.sun.jndi.dns=java.naming -Djna.boot.library.path=%reDevil% -Dlog4j2.formatMsgNoLookups=true --add-opens java.base/java.io=ALL-UNNAMED %Args% -Djava.library.path=%reDevil% -XX:+DisableAttachMechanism -cp genesis-0.1.0-SNAPSHOT-all.jar;v1_7-0.1.0-SNAPSHOT-all.jar;common-0.1.0-SNAPSHOT-all.jar;optifine-0.1.0-SNAPSHOT-all.jar;lunar-lang.jar;lunar-emote.jar;lunar.jar com.moonsworth.lunar.genesis.Genesis --version 1.7.10 --accessToken 0 --assetIndex 1.7 --userProperties {} --gameDir %APPDATA%\.minecraft --texturesDir %USERPROFILE%\.lunarclient\textures --ichorClassPath genesis-0.1.0-SNAPSHOT-all.jar;v1_7-0.1.0-SNAPSHOT-all.jar;common-0.1.0-SNAPSHOT-all.jar;optifine-0.1.0-SNAPSHOT-all.jar;lunar-lang.jar;lunar-emote.jar;lunar.jar --ichorExternalFiles OptiFine_v1_7.jar --workingDirectory . --classpathDir . --width 854 --height 480
cls
ping localhost -n 4.5 >nul
echo Process Created!
ping localhost -n 5.5 >nul
echo Checking Process...
:dripcheck
tasklist|find "javaw.exe" > NUL
if %ERRORLEVEL% == 0 ( 
    call :continuees
) else ( 
     call :noprocess
)

:noprocess
echo Process Not Created!
ping localhost -n 3.5 >nul
echo Please Report The Error At the Discord
echo Also Verify if you Have Installed That Version.
ping localhost -n 6.7 >nul
goto launcher

:continuees
ping localhost -n 5.5 >nul
echo Process Working!
ping localhost -n 1.0 >nul
echo Preparing to Launch...
ping localhost -n 5.5 >nul
echo Launching...
ping localhost -n 5.5 >nul
ping localhost -n 5.5 >nul
echo Launched!
ping localhost -n 1.0 >nul
exit


:1.8
cls
echo Creating Process...
ping localhost -n 3.5 >nul
set Args=-Xms3G -Xmx3G -Xmn1G -XX:+UnlockExperimentalVMOptions -XX:+UseG1GC -XX:G1NewSizePercent=20 -XX:G1ReservePercent=20 -XX:MaxGCPauseMillis=50 -XX:G1HeapRegionSize=32M
for /f "delims=" %%x in (files\path.txt) do set pather=%%x
set reDevil=%pather%\files\natives\1.7-1.12

IF EXIST "files\lunarpath.txt" (
    for /f "delims=" %%c in (files\lunarpath.txt) do set scd=%%c
) ELSE (
    set scd=%userprofile%\.lunarclient
)

cd %scd%\offline\multiver
for /D %%I in ("%pather%\files\jre\1.7-1.19\zulu*") do start "Monar Debug" %%~I\bin\javaw.exe --add-modules jdk.naming.dns --add-exports jdk.naming.dns/com.sun.jndi.dns=java.naming -Djna.boot.library.path=%reDevil% -Dlog4j2.formatMsgNoLookups=true --add-opens java.base/java.io=ALL-UNNAMED %Args% -Djava.library.path=%reDevil% -XX:+DisableAttachMechanism -cp genesis-0.1.0-SNAPSHOT-all.jar;v1_8-0.1.0-SNAPSHOT-all.jar;common-0.1.0-SNAPSHOT-all.jar;optifine-0.1.0-SNAPSHOT-all.jar;lunar-lang.jar;lunar-emote.jar;lunar.jar com.moonsworth.lunar.genesis.Genesis --version 1.8.9 --accessToken 0 --assetIndex 1.8 --userProperties {} --gameDir %APPDATA%\.minecraft --texturesDir %USERPROFILE%\.lunarclient\textures --ichorClassPath genesis-0.1.0-SNAPSHOT-all.jar;v1_8-0.1.0-SNAPSHOT-all.jar;common-0.1.0-SNAPSHOT-all.jar;optifine-0.1.0-SNAPSHOT-all.jar;lunar-lang.jar;lunar-emote.jar;lunar.jar --ichorExternalFiles OptiFine_v1_8.jar --workingDirectory . --classpathDir . --width 854 --height 480
cls
ping localhost -n 4.5 >nul
echo Process Created!
ping localhost -n 5.5 >nul
echo Checking Process...
:dripcheck
tasklist|find "javaw.exe" > NUL
if %ERRORLEVEL% == 0 ( 
    call :continuees
) else ( 
     call :noprocess
)

:noprocess
echo Process Not Created!
ping localhost -n 3.5 >nul
echo Please Report The Error At the Discord
echo Also Verify if you Have Installed That Version.
ping localhost -n 6.7 >nul
goto launcher

:continuees
ping localhost -n 5.5 >nul
echo Process Working!
ping localhost -n 1.0 >nul
echo Preparing to Launch...
ping localhost -n 5.5 >nul
echo Launching...
ping localhost -n 5.5 >nul
ping localhost -n 5.5 >nul
echo Launched!
ping localhost -n 1.0 >nul
exit


:1.12
cls
echo Creating Process...
ping localhost -n 3.5 >nul
set Args=-Xms3G -Xmx3G -Xmn1G -XX:+UnlockExperimentalVMOptions -XX:+UseG1GC -XX:G1NewSizePercent=20 -XX:G1ReservePercent=20 -XX:MaxGCPauseMillis=50 -XX:G1HeapRegionSize=32M
for /f "delims=" %%x in (files\path.txt) do set pather=%%x
set reDevil=%pather%\files\natives\1.7-1.12

IF EXIST "files\lunarpath.txt" (
    for /f "delims=" %%c in (files\lunarpath.txt) do set scd=%%c
) ELSE (
    set scd=%userprofile%\.lunarclient
)

cd %scd%\offline\multiver
for /D %%I in ("%pather%\files\jre\1.7-1.19\zulu*") do start "Monar Debug" %%~I\bin\javaw.exe --add-modules jdk.naming.dns --add-exports jdk.naming.dns/com.sun.jndi.dns=java.naming -Djna.boot.library.path=%reDevil% -Dlog4j2.formatMsgNoLookups=true --add-opens java.base/java.io=ALL-UNNAMED %Args% -Djava.library.path=%reDevil% -XX:+DisableAttachMechanism -cp genesis-0.1.0-SNAPSHOT-all.jar;v1_12-0.1.0-SNAPSHOT-all.jar;common-0.1.0-SNAPSHOT-all.jar;optifine-0.1.0-SNAPSHOT-all.jar;lunar-lang.jar;lunar-emote.jar;lunar.jar com.moonsworth.lunar.genesis.Genesis --version 1.12.2 --accessToken 0 --assetIndex 1.12 --userProperties {} --gameDir %APPDATA%\.minecraft --texturesDir %USERPROFILE%\.lunarclient\textures --ichorClassPath genesis-0.1.0-SNAPSHOT-all.jar;v1_12-0.1.0-SNAPSHOT-all.jar;common-0.1.0-SNAPSHOT-all.jar;optifine-0.1.0-SNAPSHOT-all.jar;lunar-lang.jar;lunar-emote.jar;lunar.jar --ichorExternalFiles OptiFine_v1_12.jar --workingDirectory . --classpathDir . --width 854 --height 480
cls
ping localhost -n 4.5 >nul
echo Process Created!
::createdby
::la 
::wea 
::cosmica
::#3727
ping localhost -n 5.5 >nul
echo Checking Process...
:dripcheck
tasklist|find "javaw.exe" > NUL
if %ERRORLEVEL% == 0 ( 
    call :continuees
) else ( 
     call :noprocess
)

:noprocess
echo Process Not Created!
ping localhost -n 3.5 >nul
echo Please Report The Error At the Discord
echo Also Verify if you Have Installed That Version.
ping localhost -n 6.7 >nul
goto launcher

:continuees
ping localhost -n 5.5 >nul
echo Process Working!
ping localhost -n 1.0 >nul
echo Preparing to Launch...
ping localhost -n 5.5 >nul
echo Launching...
ping localhost -n 5.5 >nul
ping localhost -n 5.5 >nul
echo Launched!
ping localhost -n 1.0 >nul
exit


:1.16
cls
echo Creating Process...
ping localhost -n 3.5 >nul
set Args=-Xms3G -Xmx3G -Xmn1G -XX:+UnlockExperimentalVMOptions -XX:+UseG1GC -XX:G1NewSizePercent=20 -XX:G1ReservePercent=20 -XX:MaxGCPauseMillis=50 -XX:G1HeapRegionSize=32M
for /f "delims=" %%x in (files\path.txt) do set pather=%%x
set reDevil=%pather%\files\natives\1.16-1.19

IF EXIST "files\lunarpath.txt" (
    for /f "delims=" %%c in (files\lunarpath.txt) do set scd=%%c
) ELSE (
    set scd=%userprofile%\.lunarclient
)

cd %scd%\offline\multiver
for /D %%I in ("%pather%\files\jre\1.7-1.19\zulu*") do start "Monar Debug" %%~I\bin\javaw.exe --add-modules jdk.naming.dns --add-exports jdk.naming.dns/com.sun.jndi.dns=java.naming -Djna.boot.library.path=%reDevil% -Dlog4j2.formatMsgNoLookups=true --add-opens java.base/java.io=ALL-UNNAMED %Args% -Djava.library.path=%reDevil% -XX:+DisableAttachMechanism -cp genesis-0.1.0-SNAPSHOT-all.jar;v1_16-0.1.0-SNAPSHOT-all.jar;common-0.1.0-SNAPSHOT-all.jar;optifine-0.1.0-SNAPSHOT-all.jar;lunar-lang.jar;lunar-emote.jar;lunar.jar com.moonsworth.lunar.genesis.Genesis --version 1.16.5 --accessToken 0 --assetIndex 1.16 --userProperties {} --gameDir %APPDATA%\.minecraft --texturesDir %USERPROFILE%\.lunarclient\textures --ichorClassPath genesis-0.1.0-SNAPSHOT-all.jar;v1_16-0.1.0-SNAPSHOT-all.jar;common-0.1.0-SNAPSHOT-all.jar;optifine-0.1.0-SNAPSHOT-all.jar;lunar-lang.jar;lunar-emote.jar;lunar.jar --ichorExternalFiles OptiFine_v1_16.jar --workingDirectory . --classpathDir . --width 854 --height 480
cls
ping localhost -n 4.5 >nul
echo Process Created!
ping localhost -n 5.5 >nul
echo Checking Process...
:dripcheck
tasklist|find "javaw.exe" > NUL
if %ERRORLEVEL% == 0 ( 
    call :continuees
) else ( 
     call :noprocess
)
::createdby
::la 
::wea 
::cosmica
::#3727
:noprocess
echo Process Not Created!
ping localhost -n 3.5 >nul
echo Please Report The Error At the Discord
echo Also Verify if you Have Installed That Version.
ping localhost -n 6.7 >nul
goto launcher

:continuees
ping localhost -n 5.5 >nul
echo Process Working!
ping localhost -n 1.0 >nul
echo Preparing to Launch...
ping localhost -n 5.5 >nul
echo Launching...
ping localhost -n 5.5 >nul
ping localhost -n 5.5 >nul
echo Launched!
ping localhost -n 1.0 >nul
exit


:1.17
cls
echo Creating Process...
ping localhost -n 3.5 >nul
set Args=-Xms3G -Xmx3G -Xmn1G -XX:+UnlockExperimentalVMOptions -XX:+UseG1GC -XX:G1NewSizePercent=20 -XX:G1ReservePercent=20 -XX:MaxGCPauseMillis=50 -XX:G1HeapRegionSize=32M
for /f "delims=" %%x in (files\path.txt) do set pather=%%x
set reDevil=%pather%\files\natives\1.16-1.19

IF EXIST "files\lunarpath.txt" (
    for /f "delims=" %%c in (files\lunarpath.txt) do set scd=%%c
) ELSE (
    set scd=%userprofile%\.lunarclient
)

cd %scd%\offline\multiver
for /D %%I in ("%pather%\files\jre\1.7-1.19\zulu*") do start "Monar Debug" %%~I\bin\javaw.exe --add-modules jdk.naming.dns --add-exports jdk.naming.dns/com.sun.jndi.dns=java.naming -Djna.boot.library.path=%reDevil% -Dlog4j2.formatMsgNoLookups=true --add-opens java.base/java.io=ALL-UNNAMED %Args% -Djava.library.path=%reDevil% -XX:+DisableAttachMechanism -cp genesis-0.1.0-SNAPSHOT-all.jar;v1_17-0.1.0-SNAPSHOT-all.jar;common-0.1.0-SNAPSHOT-all.jar;optifine-0.1.0-SNAPSHOT-all.jar;lunar-lang.jar;lunar-emote.jar;lunar.jar com.moonsworth.lunar.genesis.Genesis --version 1.17.1 --accessToken 0 --assetIndex 1.17 --userProperties {} --gameDir %APPDATA%\.minecraft --texturesDir %USERPROFILE%\.lunarclient\textures --ichorClassPath genesis-0.1.0-SNAPSHOT-all.jar;v1_17-0.1.0-SNAPSHOT-all.jar;common-0.1.0-SNAPSHOT-all.jar;optifine-0.1.0-SNAPSHOT-all.jar;lunar-lang.jar;lunar-emote.jar;lunar.jar --ichorExternalFiles OptiFine_v1_17.jar --workingDirectory . --classpathDir . --width 854 --height 480
cls
ping localhost -n 4.5 >nul
echo Process Created!
ping localhost -n 5.5 >nul
echo Checking Process...
:dripcheck
tasklist|find "javaw.exe" > NUL
if %ERRORLEVEL% == 0 ( 
    call :continuees
) else ( 
     call :noprocess
)

:noprocess
echo Process Not Created!
ping localhost -n 3.5 >nul
echo Please Report The Error At the Discord
echo Also Verify if you Have Installed That Version.
ping localhost -n 6.7 >nul
goto launcher

:continuees
ping localhost -n 5.5 >nul
echo Process Working!
ping localhost -n 1.0 >nul
echo Preparing to Launch...
ping localhost -n 5.5 >nul
echo Launching...
ping localhost -n 5.5 >nul
ping localhost -n 5.5 >nul
echo Launched!
ping localhost -n 1.0 >nul
exit


:1.18
title Monar Launcher V%vrs% / Version Selection
cls
echo.
echo		    ███╗   ███╗ █████╗ ███╗  ██╗ █████╗ ██████╗ 
echo		    ████╗ ████║██╔══██╗████╗ ██║██╔══██╗██╔══██╗
echo		    ██╔████╔██║██║  ██║██╔██╗██║███████║██████╔╝
echo		    ██║╚██╔╝██║██║  ██║██║╚████║██╔══██║██╔══██╗
echo		    ██║ ╚═╝ ██║╚█████╔╝██║ ╚███║██║  ██║██║  ██║
echo	       	    ╚═╝     ╚═╝ ╚════╝ ╚═╝  ╚══╝╚═╝  ╚═╝╚═╝  ╚═╝
echo.
echo                       Select a Version:
echo			      1) 1.18.1
echo			      2) 1.18.2
set /p verop2=Version:
if "%verop2%"=="1" goto 1.18.1
if "%verop2%"=="2" goto 1.18.2


echo Please enter a valid option & timeout /t 1 >nul & goto 1.18
goto 1.18

:1.18.1
cls
echo Creating Process...
ping localhost -n 3.5 >nul
set Args=-Xms3G -Xmx3G -Xmn1G -XX:+UnlockExperimentalVMOptions -XX:+UseG1GC -XX:G1NewSizePercent=20 -XX:G1ReservePercent=20 -XX:MaxGCPauseMillis=50 -XX:G1HeapRegionSize=32M
for /f "delims=" %%x in (files\path.txt) do set pather=%%x
set reDevil=%pather%\files\natives\1.16-1.19

IF EXIST "files\lunarpath.txt" (
    for /f "delims=" %%c in (files\lunarpath.txt) do set scd=%%c
) ELSE (
    set scd=%userprofile%\.lunarclient
)

cd %scd%\offline\multiver
for /D %%I in ("%pather%\files\jre\1.7-1.19\zulu*") do start "Monar Debug" %%~I\bin\javaw.exe --add-modules jdk.naming.dns --add-exports jdk.naming.dns/com.sun.jndi.dns=java.naming -Djna.boot.library.path=%reDevil% -Dlog4j2.formatMsgNoLookups=true --add-opens java.base/java.io=ALL-UNNAMED %Args% -Djava.library.path=%reDevil% -XX:+DisableAttachMechanism -cp genesis-0.1.0-SNAPSHOT-all.jar;v1_18-0.1.0-SNAPSHOT-all.jar;common-0.1.0-SNAPSHOT-all.jar;optifine-0.1.0-SNAPSHOT-all.jar;lunar-lang.jar;lunar-emote.jar;lunar.jar com.moonsworth.lunar.genesis.Genesis --version 1.18.1 --accessToken 0 --assetIndex 1.18 --userProperties {} --gameDir %APPDATA%\.minecraft --texturesDir %USERPROFILE%\.lunarclient\textures --ichorClassPath genesis-0.1.0-SNAPSHOT-all.jar;v1_18-0.1.0-SNAPSHOT-all.jar;common-0.1.0-SNAPSHOT-all.jar;optifine-0.1.0-SNAPSHOT-all.jar;lunar-lang.jar;lunar-emote.jar;lunar.jar --ichorExternalFiles OptiFine_v1_18_1.jar --workingDirectory . --classpathDir . --width 854 --height 480
cls
ping localhost -n 4.5 >nul
echo Process Created!
ping localhost -n 5.5 >nul
echo Checking Process...
:dripcheck
tasklist|find "javaw.exe" > NUL
if %ERRORLEVEL% == 0 ( 
    call :continuees
) else ( 
     call :noprocess
)

:noprocess
echo Process Not Created!
ping localhost -n 3.5 >nul
echo Please Report The Error At the Discord
echo Also Verify if you Have Installed That Version.
ping localhost -n 6.7 >nul
goto launcher

:continuees
ping localhost -n 5.5 >nul
echo Process Working!
ping localhost -n 1.0 >nul
echo Preparing to Launch...
ping localhost -n 5.5 >nul
echo Launching...
ping localhost -n 5.5 >nul
ping localhost -n 5.5 >nul
echo Launched!
ping localhost -n 1.0 >nul
exit


:1.18.2
cls
echo Creating Process...
ping localhost -n 3.5 >nul
set Args=-Xms3G -Xmx3G -Xmn1G -XX:+UnlockExperimentalVMOptions -XX:+UseG1GC -XX:G1NewSizePercent=20 -XX:G1ReservePercent=20 -XX:MaxGCPauseMillis=50 -XX:G1HeapRegionSize=32M
for /f "delims=" %%x in (files\path.txt) do set pather=%%x
set reDevil=%pather%\files\natives\1.16-1.19

IF EXIST "files\lunarpath.txt" (
    for /f "delims=" %%c in (files\lunarpath.txt) do set scd=%%c
) ELSE (
    set scd=%userprofile%\.lunarclient
)

cd %scd%\offline\multiver
for /D %%I in ("%pather%\files\jre\1.7-1.19\zulu*") do start "Monar Debug" %%~I\bin\javaw.exe --add-modules jdk.naming.dns --add-exports jdk.naming.dns/com.sun.jndi.dns=java.naming -Djna.boot.library.path=%reDevil% -Dlog4j2.formatMsgNoLookups=true --add-opens java.base/java.io=ALL-UNNAMED %Args% -Djava.library.path=%reDevil% -XX:+DisableAttachMechanism -cp genesis-0.1.0-SNAPSHOT-all.jar;v1_18-0.1.0-SNAPSHOT-all.jar;common-0.1.0-SNAPSHOT-all.jar;optifine-0.1.0-SNAPSHOT-all.jar;lunar-lang.jar;lunar-emote.jar;lunar.jar com.moonsworth.lunar.genesis.Genesis --version 1.18.2 --accessToken 0 --assetIndex 1.18 --userProperties {} --gameDir %APPDATA%\.minecraft --texturesDir %USERPROFILE%\.lunarclient\textures --ichorClassPath genesis-0.1.0-SNAPSHOT-all.jar;v1_18-0.1.0-SNAPSHOT-all.jar;common-0.1.0-SNAPSHOT-all.jar;optifine-0.1.0-SNAPSHOT-all.jar;lunar-lang.jar;lunar-emote.jar;lunar.jar --ichorExternalFiles OptiFine_v1_18.jar --workingDirectory . --classpathDir . --width 854 --height 480
cls
ping localhost -n 4.5 >nul
echo Process Created!
ping localhost -n 5.5 >nul
echo Checking Process...
:dripcheck
tasklist|find "javaw.exe" > NUL
if %ERRORLEVEL% == 0 ( 
    call :continuees
) else ( 
     call :noprocess
)

:noprocess
echo Process Not Created!
ping localhost -n 3.5 >nul
echo Please Report The Error At the Discord
echo Also Verify if you Have Installed That Version.
ping localhost -n 6.7 >nul
goto launcher

:continuees
ping localhost -n 5.5 >nul
echo Process Working!
ping localhost -n 1.0 >nul
echo Preparing to Launch...
ping localhost -n 5.5 >nul
echo Launching...
ping localhost -n 5.5 >nul
ping localhost -n 5.5 >nul
echo Launched!
ping localhost -n 1.0 >nul
exit


:1.19
cls
echo SOON!
ping localhost -n 3.5 >nul
goto launcher



:cokcheck
title Monar Launcher V%vrs% / TroubleShooting...
cls
echo.
echo		    ███╗   ███╗ █████╗ ███╗  ██╗ █████╗ ██████╗ 
echo		    ████╗ ████║██╔══██╗████╗ ██║██╔══██╗██╔══██╗
echo		    ██╔████╔██║██║  ██║██╔██╗██║███████║██████╔╝
echo		    ██║╚██╔╝██║██║  ██║██║╚████║██╔══██║██╔══██╗
echo		    ██║ ╚═╝ ██║╚█████╔╝██║ ╚███║██║  ██║██║  ██║
echo	       	    ╚═╝     ╚═╝ ╚════╝ ╚═╝  ╚══╝╚═╝  ╚═╝╚═╝  ╚═╝
echo.
echo              WARNING PEPOLE WITH SPACES IN THEIR PC NAME
echo                        ITS NOT SUPPORTED!
echo.
echo Checking Lunar Folder....
ping localhost -n 3.5 >nul

if exist %userprofile%\.lunarclient (

echo [+] Lunar Folder Working.
ping localhost -n 3.5 >nul

) else (
echo [-] Your Lunar Folder was not Found...
echo Please Create a .txt file
echo with the "lunarpath" name
echo and put it on "files" folder.
echo and put the location of your
echo lunar client folder
echo If you have problems
echo or just dont know
echo what i am talking
echo just check our discord
ping localhost -n 30.8 >nul
exit
)


for /f "delims=" %%x in (files\path.txt) do set pather=%%x
echo.
echo Checking Path...
ping localhost -n 3.5 >nul
echo Your Path is: "%pather%" (if you dont see nothing please check the setup instrucions)
ping localhost -n 3.5 >nul


echo.
echo Checking Lunar Version's...
IF EXIST "files\lunarpath.txt" (
    for /f "delims=" %%c in (files\lunarpath.txt) do set scd=%%c
) ELSE (
    set scd=%userprofile%\.lunarclient
)

ping localhost -n 3.5 >nul
cd %scd%\offline\multiver
if exist v1_7-0.1.0-SNAPSHOT-all.jar (
echo [+] 1.7  Its Installed
) else (
echo [-] 1.7  Its Not Installed
)

ping localhost -n 1.5 >nul

if exist v1_8-0.1.0-SNAPSHOT-all.jar (
echo [+] 1.8  Its Installed
) else (
echo [-] 1.8  Its Not Installed
)

ping localhost -n 1.5 >nul

if exist v1_12-0.1.0-SNAPSHOT-all.jar (
echo [+] 1.12 Its Installed
) else (
echo [-] 1.12 Its Not Installed
)

ping localhost -n 1.5 >nul

if exist v1_16-0.1.0-SNAPSHOT-all.jar (
echo [+] 1.16 Its Installed
) else (
echo [-] 1.16 Its Not Installed
)

ping localhost -n 1.5 >nul

if exist v1_17-0.1.0-SNAPSHOT-all.jar (
echo [+] 1.17 Its Installed
) else (
echo [-] 1.17 Its Not Installed
)

ping localhost -n 1.5 >nul

if exist v1_18-0.1.0-SNAPSHOT-all.jar (
echo [+] 1.18 Its Installed
) else (
echo [-] 1.18 Its Not Installed
)

ping localhost -n 1.5 >nul

cd %pather%
echo.
echo Checking Jre and Natives...
if exist "files\jre\1.7-1.19\zulu17.34.19-ca-jre17.0.3-win_x64\bin\javaw.exe" (
echo [+] JRE Exist
) else (
echo [!] JRE Dont Exist, Please Reinstall Monar...
) 

ping localhost -n 1.5 >nul

if exist "files\natives\1.7-1.12\OpenAL64.dll" (
echo [+] 1.7 to 1.12 Natives Are Working!
) else (
echo [!] 1.7 to 1.12 Natives Dont Exist, Please Reinstall Monar...
) 

if exist "files\natives\1.16-1.19\OpenAL32.dll" (
echo [+] 1.16 to 1.19 Natives Are Working!
) else (
echo [!] 1.16 to 1.19 Natives Dont Exist, Please Reinstall Monar...
) 
title Monar Launcher V%vrs% / TroubleShoot Finished!
echo.
PAUSE
ping localhost -n 20.3 >nul
cls
goto gui

:basic
cls
chcp 437
cls
if "%PROCESSOR_ARCHITECTURE%" EQU "amd64" (
>nul 2>&1 "%SYSTEMROOT%\SysWOW64\cacls.exe" "%SYSTEMROOT%\SysWOW64\config\system"
) ELSE (
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
)


if '%errorlevel%' NEQ '0' (
echo Please Open the Program as Administrator
echo For Use this function
ping localhost -n 5.5 >nul
exit
) else ( goto gotAdmin )


:gotAdmin
cls
del "C:\Windows\System32\drivers\etc\hosts"
cls
powershell -Command "Invoke-WebRequest https://cdn.discordapp.com/attachments/996966993733357689/1000927933663301712/hosts -Outfile C:\Windows\System32\drivers\etc\hosts"
echo Please wait 5 - 10 seconds.
ping localhost -n 3.5 >nul
cls
echo Done LCProxy Is Installed
echo Have Fun!
ping localhost -n 3.5 >nul
cls
exit

::i.imgur.com/66Xc6wD.png
:uninstall
cls
chcp 437
cls
if "%PROCESSOR_ARCHITECTURE%" EQU "amd64" (
>nul 2>&1 "%SYSTEMROOT%\SysWOW64\cacls.exe" "%SYSTEMROOT%\SysWOW64\config\system"
) ELSE (
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
)


if '%errorlevel%' NEQ '0' (
echo Please Open the Program as Administrator
echo for Use this function
ping localhost -n 5.5 >nul
exit
) else ( goto gotAdmin )


:gotAdmin
cls
echo Uninstalling LCProxy...
ping localhost -n 2 >nul
set "HostsFile=%SystemRoot%\System32\drivers\etc\hosts"
%SystemRoot%\System32\attrib.exe -r "%HostsFile%"
%SystemRoot%\System32\findstr.exe /I /R /V "159.223.111.198 assetserver.lunarclientprod.com ^$" "%HostsFile%" >"%TEMP%\%~n0.tmp"
move /Y "%TEMP%\%~n0.tmp" "%HostsFile%"
if errorlevel 1 del "%TEMP%\%~n0.tmp
ping localhost -n 2 >nul
cls
ECHO Successfully Uninstalled LCProxy!
ping localhost -n 2 >nul
echo Please wait 5 - 10 seconds for your cosmetics to get removed fully!
ping localhost -n 3.5 >nul
cls
exit
