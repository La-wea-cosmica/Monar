echo off
mode con lines=30 cols=68
:VerionCheck
set actualver=1.4.1

for /f "delims=" %%h in (%APPDATA%\monar_version\versionload.txt) do set verchecks=%%h
if "%verchecks%"=="%actualver%" (
goto DefaultSettings
) else (
echo [!] Old/Different Version Detected!
ping localhost -n 3.5 >nul
goto resetdefsetin
)

:DefaultSettings
cls
if exist "%appdata%\.monar" (
goto gui
) else (
mkdir %APPDATA%\".monar"
mkdir %APPDATA%\"monar_version"
echo w>%APPDATA%\.monar\debug.txt
>%APPDATA%\monar_version\versionload.txt echo %actualver%
>%APPDATA%\.monar\ram_min.txt echo 1
>%APPDATA%\.monar\ram.txt echo 3
>%APPDATA%\.monar\lcproxupdate_ip.txt echo 143.198.116.11
>%APPDATA%\.monar\lcproxupdate_hosturl.txt echo https://cdn.discordapp.com/attachments/996966993733357689/1067881136124076212/hosts
>%APPDATA%\.monar\serverjoin.txt echo disable
>%APPDATA%\.monar\lunarxforge.txt echo disable
>%APPDATA%\.monar\lunarxsodium.txt echo disable
>%APPDATA%\.monar\unsigned.txt echo disable
>%APPDATA%\.monar\cosmetic.txt echo enable
>%APPDATA%\.monar\minecraftlocation.txt echo %appdata%\.minecraft
>%APPDATA%\.monar\lunarlocation.txt echo %userprofile%\.lunarclient
cls
echo [!] Monar Settings Created!
ping localhost -n 3.5 >nul
) 


:gui
cls
chcp 65001 >nul 2>&1
cls
set version=1.4.1
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
echo                    Created by La wea Cosmica#3727
echo.
echo				1) Launcher
echo				2) Addons
echo                         3) TroubleShoot
echo                         4) Settings
echo.
set /p op=Option:
if "%op%"=="1" goto launcher
if "%op%"=="2" goto addonz
if "%op%"=="3" goto cokcheck 
if "%op%"=="4" goto setupinn

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

echo Please enter a valid option & timeout /t 1 >nul & goto addonz
goto addonz

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
echo                         3) Update
echo                         0) Back
set /p opitk=Option:
if "%opitk%"=="0" goto gui
if "%opitk%"=="1" goto basic
if "%opitk%"=="2" goto uninstall
if "%opitk%"=="3" goto updatelcproxy

echo Please enter a valid option & timeout /t 1 >nul & goto lcproxy
goto lcproxy


:launcher
cls
for /f "delims=" %%u in (%APPDATA%\.monar\unsigned.txt) do set unsignedt=%%u
if "%unsignedt%"=="enable" (
goto gudneis
) else (
goto admincheckk
)


:admincheckk
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
cls
title Monar Launcher V%vrs% / Launcher Menu
echo.
echo		    ███╗   ███╗ █████╗ ███╗  ██╗ █████╗ ██████╗ 
echo		    ████╗ ████║██╔══██╗████╗ ██║██╔══██╗██╔══██╗
echo		    ██╔████╔██║██║  ██║██╔██╗██║███████║██████╔╝
echo		    ██║╚██╔╝██║██║  ██║██║╚████║██╔══██║██╔══██╗
echo		    ██║ ╚═╝ ██║╚█████╔╝██║ ╚███║██║  ██║██║  ██║
echo	       	    ╚═╝     ╚═╝ ╚════╝ ╚═╝  ╚══╝╚═╝  ╚═╝╚═╝  ╚═╝  
echo.
for /f "delims=" %%u in (%APPDATA%\.monar\unsigned.txt) do set unsignedt=%%u
if "%unsignedt%"=="enable" (
echo                        Unsigned Mode!
) else (
echo                        Welcome back!
)
echo.
echo                       Select a Version:
echo			      1) 1.7.10
echo			      2) 1.8.9
echo			      3) 1.12.2
echo			      4) 1.16.5
echo			      5) 1.17.1
echo			      6) 1.18.X
echo                       7) 1.19.X
echo			      0) Back
echo.
set /p verop=Version:
if "%verop%"=="1" goto 1.7
if "%verop%"=="2" goto 1.8
if "%verop%"=="3" goto 1.12
if "%verop%"=="4" goto 1.16
if "%verop%"=="5" goto 1.17
if "%verop%"=="6" goto 1.18
if "%verop%"=="7" goto 1.19s
if "%verop%"=="0" goto gui 

echo Please enter a valid option & timeout /t 1 >nul & goto launcher
goto installcp



::Process Check
:drippcheck
if "%debugi%"=="w" (
    set prosschang=javaw
) else (
    set prosschang=java
)

tasklist|find "%prosschang%.exe" > NUL
if %ERRORLEVEL% == 0 (
    ping localhost -n 5.5 >nul
    call :continueesi
) else ( 
    call :noprocessi
)




:noprocessi
cls
echo                        ______________________
echo                       ┃        ERROR!        ┃
echo                        ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
echo                        Process Not Created!
ping localhost -n 3.5 >nul
echo                 Please Report The Error At the Discord
echo            Also Verify if you Have Installed That Version.
ping localhost -n 6.7 >nul
goto launcher

:continueesi
cls
echo                        ______________________
echo                       ┃   Process Working!   ┃
echo                        ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
ping localhost -n 1.0 >nul
cls
echo                        ______________________
echo                       ┃  Preparing Launch... ┃
echo                        ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
ping localhost -n 5.5 >nul
cls
echo                        ______________________
echo                       ┃     Launching...     ┃
echo                        ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
ping localhost -n 5.5 >nul
ping localhost -n 5.5 >nul
cls
echo                        ______________________
echo                       ┃       Launched!      ┃
echo                        ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
ping localhost -n 2.0 >nul
exit

:SettingsLoad

for /f "delims=" %%j in (%APPDATA%\.monar\serverjoin.txt) do set servjoin=%%j

if "%servjoin%"=="disable" (
set servjoin=
) else (
set untilitye=xD
)

for /f "delims=" %%n in (%APPDATA%\.monar\lunarxforge.txt) do set lxfcheck=%%n
for /f "delims=" %%r in (%APPDATA%\.monar\ram.txt) do set ramn=%%r
for /f "delims=" %%t in (%APPDATA%\.monar\ram_min.txt) do set ramm=%%t
for /f "delims=" %%g in (%APPDATA%\.monar\lunarlocation.txt) do set cuzlunar=%%g
for /f "delims=" %%d in (%APPDATA%\.monar\minecraftlocation.txt) do set cuzminecraft=%%d
set Args=-Xms%ramn%G -Xmx%ramn%G -Xmn%ramm%G -XX:+UnlockExperimentalVMOptions -XX:+UseG1GC -XX:G1NewSizePercent=20 -XX:G1ReservePercent=20 -XX:MaxGCPauseMillis=50 -XX:G1HeapRegionSize=32M

if exist "%APPDATA%\.monar\unsigned_path.txt" (
    for /f "delims=" %%x in (%APPDATA%\.monar\unsigned_path.txt) do set pather=%%x
) else (
    for /f "delims=" %%x in (files\path.txt) do set pather=%%x
)


for /f "delims=" %%q in (%APPDATA%\.monar\debug.txt) do set debugi=%%q
set reDevil=%pather%\files\natives\1.7-1.12
set scd=%cuzlunar%
if "%lxfcheck%"=="enable" (
set forgigi=forge-0.1.0-SNAPSHOT-all.jar;skyblock-0.1.0-SNAPSHOT-all.jar;
set rembug=;DSM-v1_8-1.8.7.jar;LunatriusCore-v1_8.jar;Schematica-v1_8.jar
) else (
set forgigi=
set rembug=
)


for /f "delims=" %%c in (%APPDATA%\.monar\cosmetic.txt) do set cosmeticon=%%c
if "%cosmeticon%"=="enable" (
set cumentic=%scd%\textures
) else (
set cumentic=
)


if "%mcvrs%"=="1.7" (
    goto load0
) else (
    goto loadd1
)


:loadd1
if "%mcvrs%"=="1.8" (
    goto load1
) else (
    goto loadd2
)

:loadd2
if "%mcvrs%"=="1.12" (
    goto load2
) else (
    cls
    echo FATAL ERROR REPORT TO THE DISCORD!
    ping localhost -n 88.5 >nul
)


:SettingsLoadTWO


for /f "delims=" %%s in (%APPDATA%\.monar\lunarxsodium.txt) do set sodeum=%%s
if "%sodeum%"=="enable" (
set sodone=common-0.1.0-SNAPSHOT-all.jar
set sodtwo=fabric-0.1.0-SNAPSHOT-all.jar;fabric-0.1.0-SNAPSHOT-v%verifthe%.jar;genesis-0.1.0-SNAPSHOT-all.jar;sodium-0.1.0-SNAPSHOT-all.jar
) else (
set icheerone=--ichorExternalFiles OptiFine_v%verifthe%.jar
set sodone=genesis-0.1.0-SNAPSHOT-all.jar
set sodtwo=common-0.1.0-SNAPSHOT-all.jar;optifine-0.1.0-SNAPSHOT-all.jar
)


for /f "delims=" %%j in (%APPDATA%\.monar\serverjoin.txt) do set servjoin=%%j
if "%servjoin%"=="disable" (
set servjoin=
) else (
set untilitye=xD
)

for /f "delims=" %%r in (%APPDATA%\.monar\ram.txt) do set ramn=%%r
for /f "delims=" %%t in (%APPDATA%\.monar\ram_min.txt) do set ramm=%%t
for /f "delims=" %%g in (%APPDATA%\.monar\lunarlocation.txt) do set cuzlunar=%%g
for /f "delims=" %%d in (%APPDATA%\.monar\minecraftlocation.txt) do set cuzminecraft=%%d
set Args=-Xms%ramn%G -Xmx%ramn%G -Xmn%ramm%G -XX:+UnlockExperimentalVMOptions -XX:+UseG1GC -XX:G1NewSizePercent=20 -XX:G1ReservePercent=20 -XX:MaxGCPauseMillis=50 -XX:G1HeapRegionSize=32M

if exist "%APPDATA%\.monar\unsigned_path.txt" (
    for /f "delims=" %%x in (%APPDATA%\.monar\unsigned_path.txt) do set pather=%%x
) else (
    for /f "delims=" %%x in (files\path.txt) do set pather=%%x
)

for /f "delims=" %%q in (%APPDATA%\.monar\debug.txt) do set debugi=%%q
set reDevil=%pather%\files\natives\1.16-1.19
set scd=%cuzlunar%


for /f "delims=" %%c in (%APPDATA%\.monar\cosmetic.txt) do set cosmeticon=%%c
if "%cosmeticon%"=="enable" (
set cumentic=%scd%\textures
) else (
set cumentic=
)

:loadd3
if "%mcvrs%"=="1.16" (
    goto load3
) else (
    goto loadd4
)

:loadd4
if "%mcvrs%"=="1.17" (
    goto load4
) else (
    goto loadd5
)
:loadd5
if "%mcvrs%"=="1.18.1" (
    goto load5
) else (
    goto loadd6
)

:loadd6
if "%mcvrs%"=="1.18.2" (
    goto load6
) else (
    cls
    goto loadd7
)

:loadd7
if "%mcvrs%"=="1.19" (
    goto load7
) else (
    cls
    goto loadd8
)

:loadd8
if "%mcvrs%"=="1.19.2" (
    goto load8
) else (
    cls
    echo [!] FATAL ERROR PLEASE REPORT TO DISCORD!
    echo [!] ERROR CODE: No Finded Version Requested
    ping localhost -n 88.5 >nul
)









:1.7
cls
set mcvrs=1.7
title Monar Launcher V%vrs% / %mcvrs%
echo                        ______________________
echo                       ┃  Creating Process... ┃
echo                        ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
ping localhost -n 3.5 >nul
goto SettingsLoad

:load0
cd %scd%\offline\multiver
for /D %%I in ("%pather%\files\jre\1.7-1.19\zulu*") do start "Monar Debug" %%~I\bin\java%debugi%.exe --add-modules jdk.naming.dns --add-exports jdk.naming.dns/com.sun.jndi.dns=java.naming -Djna.boot.library.path=%reDevil% -Dlog4j2.formatMsgNoLookups=true --add-opens java.base/java.io=ALL-UNNAMED %Args% -Djava.library.path=%reDevil% -XX:+DisableAttachMechanism -cp genesis-0.1.0-SNAPSHOT-all.jar;v1_7-0.1.0-SNAPSHOT-all.jar;common-0.1.0-SNAPSHOT-all.jar;optifine-0.1.0-SNAPSHOT-all.jar;lunar-lang.jar;lunar-emote.jar;lunar.jar com.moonsworth.lunar.genesis.Genesis --version 1.7.10 --accessToken 0 --assetIndex 1.7 --userProperties {} --gameDir %cuzminecraft% --texturesDir %cumentic% --ichorClassPath genesis-0.1.0-SNAPSHOT-all.jar;v1_7-0.1.0-SNAPSHOT-all.jar;common-0.1.0-SNAPSHOT-all.jar;optifine-0.1.0-SNAPSHOT-all.jar;lunar-lang.jar;lunar-emote.jar;lunar.jar --ichorExternalFiles OptiFine_v1_7.jar --workingDirectory . --classpathDir . --width 854 --height 480 %servjoin%
cls
echo                        ______________________
echo                       ┃   Process Created!   ┃
echo                        ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
ping localhost -n 5.5 >nul
cls
echo                        ______________________
echo                       ┃  Checking Process... ┃
echo                        ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
ping localhost -n 3.5 >nul
goto drippcheck









:1.8
cls
set mcvrs=1.8
title Monar Launcher V%vrs% / %mcvrs%
echo                        ______________________
echo                       ┃  Creating Process... ┃
echo                        ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
ping localhost -n 3.5 >nul
goto SettingsLoad

:load1
cd %scd%\offline\multiver
for /D %%I in ("%pather%\files\jre\1.7-1.19\zulu*") do start "Monar Debug" %%~I\bin\java%debugi%.exe --add-modules jdk.naming.dns --add-exports jdk.naming.dns/com.sun.jndi.dns=java.naming -Djna.boot.library.path=%reDevil% -Dlog4j2.formatMsgNoLookups=true --add-opens java.base/java.io=ALL-UNNAMED %Args% -Djava.library.path=%reDevil% -XX:+DisableAttachMechanism -cp %forgigi%genesis-0.1.0-SNAPSHOT-all.jar;v1_8-0.1.0-SNAPSHOT-all.jar;common-0.1.0-SNAPSHOT-all.jar;optifine-0.1.0-SNAPSHOT-all.jar;lunar-lang.jar;lunar-emote.jar;lunar.jar com.moonsworth.lunar.genesis.Genesis --version 1.8.9 --accessToken 0 --assetIndex 1.8 --userProperties {} --gameDir %cuzminecraft% --texturesDir %cumentic% --ichorClassPath genesis-0.1.0-SNAPSHOT-all.jar;v1_8-0.1.0-SNAPSHOT-all.jar;common-0.1.0-SNAPSHOT-all.jar;optifine-0.1.0-SNAPSHOT-all.jar;lunar-lang.jar;lunar-emote.jar;lunar.jar --ichorExternalFiles OptiFine_v1_8.jar%rembug% --workingDirectory . --classpathDir . --width 854 --height 480 %servjoin%
cls
echo                        ______________________
echo                       ┃   Process Created!   ┃
echo                        ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
ping localhost -n 5.5 >nul
cls
echo                        ______________________
echo                       ┃  Checking Process... ┃
echo                        ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
ping localhost -n 4.5 >nul
goto drippcheck









:1.12
cls
set mcvrs=1.12
title Monar Launcher V%vrs% / %mcvrs%
echo                        ______________________
echo                       ┃  Creating Process... ┃
echo                        ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
ping localhost -n 3.5 >nul
goto SettingsLoad

:load2
cd %scd%\offline\multiver
for /D %%I in ("%pather%\files\jre\1.7-1.19\zulu*") do start "Monar Debug" %%~I\bin\java%debugi%.exe --add-modules jdk.naming.dns --add-exports jdk.naming.dns/com.sun.jndi.dns=java.naming -Djna.boot.library.path=%reDevil% -Dlog4j2.formatMsgNoLookups=true --add-opens java.base/java.io=ALL-UNNAMED %Args% -Djava.library.path=%reDevil% -XX:+DisableAttachMechanism -cp genesis-0.1.0-SNAPSHOT-all.jar;v1_12-0.1.0-SNAPSHOT-all.jar;common-0.1.0-SNAPSHOT-all.jar;optifine-0.1.0-SNAPSHOT-all.jar;lunar-lang.jar;lunar-emote.jar;lunar.jar com.moonsworth.lunar.genesis.Genesis --version 1.12.2 --accessToken 0 --assetIndex 1.12 --userProperties {} --gameDir %cuzminecraft% --texturesDir %cumentic% --ichorClassPath genesis-0.1.0-SNAPSHOT-all.jar;v1_12-0.1.0-SNAPSHOT-all.jar;common-0.1.0-SNAPSHOT-all.jar;optifine-0.1.0-SNAPSHOT-all.jar;lunar-lang.jar;lunar-emote.jar;lunar.jar --ichorExternalFiles OptiFine_v1_12.jar --workingDirectory . --classpathDir . --width 854 --height 480 %servjoin%
cls
echo                        ______________________
echo                       ┃   Process Created!   ┃
echo                        ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
ping localhost -n 5.5 >nul
::#3727
cls
echo                        ______________________
echo                       ┃  Checking Process... ┃
echo                        ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
ping localhost -n 4.5 >nul
goto drippcheck











:1.16
cls
set mcvrs=1.16.5
set verifthe=1_16_5
set indextt=1.16
title Monar Launcher V%vrs% / %mcvrs%
echo                        ______________________
echo                       ┃  Creating Process... ┃
echo                        ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
ping localhost -n 3.5 >nul
goto SettingsLoadTWO

:load3
cd %scd%\offline\multiver
for /D %%I in ("%pather%\files\jre\1.7-1.19\zulu*") do start "Monar Debug" %%~I\bin\java%debugi%.exe --add-modules jdk.naming.dns --add-exports jdk.naming.dns/com.sun.jndi.dns=java.naming -Djna.boot.library.path=%reDevil% -Dlog4j2.formatMsgNoLookups=true --add-opens java.base/java.io=ALL-UNNAMED %Args% -Djava.library.path=%reDevil% -XX:+DisableAttachMechanism -cp %sodone%;%sodtwo%;lunar-lang.jar;lunar-emote.jar;lunar.jar com.moonsworth.lunar.genesis.Genesis --version %mcvrs% --accessToken 0 --assetIndex %indextt% --userProperties {} --gameDir %cuzminecraft% --texturesDir %cumentic% --ichorClassPath %sodone%;%sodtwo%;lunar-lang.jar;lunar-emote.jar;lunar.jar%ifsodtree% %icheerone% --workingDirectory . --classpathDir . --width 854 --height 480 %servjoin%
cls
echo                        ______________________
echo                       ┃   Process Created!   ┃
echo                        ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
ping localhost -n 5.5 >nul
cls
echo                        ______________________
echo                       ┃  Checking Process... ┃
echo                        ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
ping localhost -n 4.5 >nul
goto drippcheck






:1.17
cls
set mcvrs=1.17.1
set verifthe=1_17_1
set indextt=1.17
title Monar Launcher V%vrs% / %mcvrs%
echo                        ______________________
echo                       ┃  Creating Process... ┃
echo                        ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
ping localhost -n 3.5 >nul
goto SettingsLoadTWO

:load4
cd %scd%\offline\multiver
for /D %%I in ("%pather%\files\jre\1.7-1.19\zulu*") do start "Monar Debug" %%~I\bin\java%debugi%.exe --add-modules jdk.naming.dns --add-exports jdk.naming.dns/com.sun.jndi.dns=java.naming -Djna.boot.library.path=%reDevil% -Dlog4j2.formatMsgNoLookups=true --add-opens java.base/java.io=ALL-UNNAMED %Args% -Djava.library.path=%reDevil% -XX:+DisableAttachMechanism -cp %sodone%;%sodtwo%;lunar-lang.jar;lunar-emote.jar;lunar.jar com.moonsworth.lunar.genesis.Genesis --version %mcvrs% --accessToken 0 --assetIndex %indextt% --userProperties {} --gameDir %cuzminecraft% --texturesDir %cumentic% --ichorClassPath %sodone%;%sodtwo%;lunar-lang.jar;lunar-emote.jar;lunar.jar%ifsodtree% %icheerone% --workingDirectory . --classpathDir . --width 854 --height 480 %servjoin%
cls
echo                        ______________________
echo                       ┃   Process Created!   ┃
echo                        ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
ping localhost -n 5.5 >nul
cls
echo                        ______________________
echo                       ┃  Checking Process... ┃
echo                        ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
ping localhost -n 4.5 >nul
goto drippcheck




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
echo			      0) Back
set /p verop2=Version:
if "%verop2%"=="0" goto gudneis
if "%verop2%"=="1" goto 1.18.1
if "%verop2%"=="2" goto 1.18.2


echo Please enter a valid option & timeout /t 1 >nul & goto 1.18
goto 1.18









:1.18.1
cls
set mcvrs=1.18.1
title Monar Launcher V%vrs% / %mcvrs%
echo                        ______________________
echo                       ┃  Creating Process... ┃
echo                        ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
ping localhost -n 3.5 >nul
goto SettingsLoadTWO

:load5
cd %scd%\offline\multiver
for /D %%I in ("%pather%\files\jre\1.7-1.19\zulu*") do start "Monar Debug" %%~I\bin\java%debugi%.exe --add-modules jdk.naming.dns --add-exports jdk.naming.dns/com.sun.jndi.dns=java.naming -Djna.boot.library.path=%reDevil% -Dlog4j2.formatMsgNoLookups=true --add-opens java.base/java.io=ALL-UNNAMED %Args% -Djava.library.path=%reDevil% -XX:+DisableAttachMechanism -cp modern-0.1.0-SNAPSHOT-all.jar;common-0.1.0-SNAPSHOT-all.jar;optifine-0.1.0-SNAPSHOT-all.jar;genesis-0.1.0-SNAPSHOT-all.jar;lunar-lang.jar;lunar-emote.jar;lunar.jar com.moonsworth.lunar.genesis.Genesis --version 1.18.1 --accessToken 0 --assetIndex 1.18 --userProperties {} --gameDir %cuzminecraft% --texturesDir %cumentic% --ichorClassPath modern-0.1.0-SNAPSHOT-all.jar;common-0.1.0-SNAPSHOT-all.jar;optifine-0.1.0-SNAPSHOT-all.jar;genesis-0.1.0-SNAPSHOT-all.jar;lunar-lang.jar;lunar-emote.jar;lunar.jar --ichorExternalFiles OptiFine_v%verifthe%.jar --workingDirectory . --classpathDir . --width 854 --height 480 %servjoin%
cls
echo                        ______________________
echo                       ┃   Process Created!   ┃
echo                        ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
ping localhost -n 5.5 >nul
cls
echo                        ______________________
echo                       ┃  Checking Process... ┃
echo                        ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
ping localhost -n 4.5 >nul
goto drippcheck










:1.18.2
cls
set verifthe=1_18_2
set mcvrs=1.18.2
set indextt=1.18
title Monar Launcher V%vrs% / %mcvrs%
echo                        ______________________
echo                       ┃  Creating Process... ┃
echo                        ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
ping localhost -n 3.5 >nul
goto SettingsLoadTWO

:load6
cd %scd%\offline\multiver
for /D %%I in ("%pather%\files\jre\1.7-1.19\zulu*") do start "Monar Debug" %%~I\bin\java%debugi%.exe --add-modules jdk.naming.dns --add-exports jdk.naming.dns/com.sun.jndi.dns=java.naming -Djna.boot.library.path=%reDevil% -Dlog4j2.formatMsgNoLookups=true --add-opens java.base/java.io=ALL-UNNAMED %Args% -Djava.library.path=%reDevil% -XX:+DisableAttachMechanism -cp %sodone%;%sodtwo%;lunar-lang.jar;lunar-emote.jar;lunar.jar com.moonsworth.lunar.genesis.Genesis --version %mcvrs% --accessToken 0 --assetIndex %indextt% --userProperties {} --gameDir %cuzminecraft% --texturesDir %cumentic% --ichorClassPath %sodone%;%sodtwo%;lunar-lang.jar;lunar-emote.jar;lunar.jar%ifsodtree% %icheerone% --workingDirectory . --classpathDir . --width 854 --height 480 %servjoin%
cls
echo                        ______________________
echo                       ┃   Process Created!   ┃
echo                        ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
ping localhost -n 5.5 >nul
cls
echo                        ______________________
echo                       ┃  Checking Process... ┃
echo                        ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
ping localhost -n 4.5 >nul
goto drippcheck









:1.19s
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
echo       [!] WARNING! If you used 1.19.2, you cannot open 1.19
echo       Launch if you want it just open 1.19 via org launcher
echo      then open it with monar, (its the same thing if you used 1.19)
echo.
echo                       Select a Version:
echo			      1) 1.19
echo			      2) 1.19.2
echo			      0) Back
set /p verop3=Version:
if "%verop3%"=="0" goto gudneis
if "%verop3%"=="1" goto 1.19
if "%verop3%"=="2" goto 1.19.2


echo Please enter a valid option & timeout /t 1 >nul & goto 1.18
goto 1.18




:1.19
cls
set mcvrs=1.19
title Monar Launcher V%vrs% / %mcvrs%
echo                        ______________________
echo                       ┃  Creating Process... ┃
echo                        ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
ping localhost -n 3.5 >nul
goto SettingsLoadTWO

:load7
cd %scd%\offline\multiver
for /D %%I in ("%pather%\files\jre\1.7-1.19\zulu*") do start "Monar Debug" %%~I\bin\java%debugi%.exe --add-modules jdk.naming.dns --add-exports jdk.naming.dns/com.sun.jndi.dns=java.naming -Djna.boot.library.path=%reDevil% -Dlog4j2.formatMsgNoLookups=true --add-opens java.base/java.io=ALL-UNNAMED %Args% -Djava.library.path=%reDevil% -XX:+DisableAttachMechanism -cp modern-0.1.0-SNAPSHOT-all.jar;common-0.1.0-SNAPSHOT-all.jar;optifine-0.1.0-SNAPSHOT-all.jar;genesis-0.1.0-SNAPSHOT-all.jar;lunar-lang.jar;lunar-emote.jar;lunar.jar com.moonsworth.lunar.genesis.Genesis --version 1.19 --accessToken 0 --assetIndex 1.19 --userProperties {} --gameDir %cuzminecraft% --texturesDir %cumentic% --ichorClassPath modern-0.1.0-SNAPSHOT-all.jar;common-0.1.0-SNAPSHOT-all.jar;optifine-0.1.0-SNAPSHOT-all.jar;genesis-0.1.0-SNAPSHOT-all.jar;lunar-lang.jar;lunar-emote.jar;lunar.jar --ichorExternalFiles OptiFine_v1_19_0.jar --workingDirectory . --classpathDir . --width 854 --height 480 %servjoin%
cls
echo                        ______________________
echo                       ┃   Process Created!   ┃
echo                        ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
ping localhost -n 5.5 >nul
cls
echo                        ______________________
echo                       ┃  Checking Process... ┃
echo                        ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
ping localhost -n 4.5 >nul
goto drippcheck







:1.19.2
cls
set verifthe=1_19_2
set mcvrs=1.19.2
set indextt=1.19
title Monar Launcher V%vrs% / %mcvrs%
echo                        ______________________
echo                       ┃  Creating Process... ┃
echo                        ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
ping localhost -n 3.5 >nul
goto SettingsLoadTWO

:load8
cd %scd%\offline\multiver
for /D %%I in ("%pather%\files\jre\1.7-1.19\zulu*") do start "Monar Debug" %%~I\bin\java%debugi%.exe --add-modules jdk.naming.dns --add-exports jdk.naming.dns/com.sun.jndi.dns=java.naming -Djna.boot.library.path=%reDevil% -Dlog4j2.formatMsgNoLookups=true --add-opens java.base/java.io=ALL-UNNAMED %Args% -Djava.library.path=%reDevil% -XX:+DisableAttachMechanism -cp %sodone%;%sodtwo%;lunar-lang.jar;lunar-emote.jar;lunar.jar com.moonsworth.lunar.genesis.Genesis --version %mcvrs% --accessToken 0 --assetIndex %indextt% --userProperties {} --gameDir %cuzminecraft% --texturesDir %cumentic% --ichorClassPath %sodone%;%sodtwo%;lunar-lang.jar;lunar-emote.jar;lunar.jar%ifsodtree% %icheerone% --workingDirectory . --classpathDir . --width 854 --height 480 %servjoin%
cls
echo                        ______________________
echo                       ┃   Process Created!   ┃
echo                        ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
ping localhost -n 5.5 >nul
cls
echo                        ______________________
echo                       ┃  Checking Process... ┃
echo                        ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
ping localhost -n 4.5 >nul
goto drippcheck


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
ping localhost -n 1.5 >nul
for /f "delims=" %%g in (%APPDATA%\.monar\lunarlocation.txt) do set cuzlunar=%%g

if exist "%APPDATA%\.monar\unsigned_path.txt" (
    for /f "delims=" %%x in (%APPDATA%\.monar\unsigned_path.txt) do set pather=%%x
) else (
    for /f "delims=" %%x in (files\path.txt) do set pather=%%x
)

if exist "%cuzlunar%" (
echo [+] Lunar Folder Working.
ping localhost -n 1.5 >nul
) else (
echo [-] Your Lunar Folder was not Found...
echo Please report error at discord.
ping localhost -n 30.8 >nul
exit
)

echo.
echo Checking Path...
ping localhost -n 1.5 >nul
echo Your Path is: "%pather%"
echo if you see "<Copy paste here your path>" 
echo please check the setup instrucions
ping localhost -n 1.5 >nul


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

if exist v1_19-0.1.0-SNAPSHOT-all.jar (
echo [+] 1.19 Its Installed
) else (
echo [-] 1.19 Its Not Installed
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

if exist "files\natives\1.16-1.19\MumbleLink.dll" (
echo [+] 1.16 to 1.19 Natives Are Working!
) else (
echo [!] 1.16 to 1.19 Natives Dont Exist, Please Reinstall Monar...
) 
title Monar Launcher V%vrs% / TroubleShoot Finished!
echo.
PAUSE
cls
goto gui




:setupinn
cls
title Monar Launcher V%vrs% / Settings
if exist "%appdata%\.monar" (
goto statinup
) else (
mkdir %APPDATA%\".monar"
echo [!] FATAL ERROR MONAR SETTINGS FOLDER DONT EXISTS!
echo [!] PLEASE REPORT THE ERROR AT DISCORD!
ping localhost -n 20.5 >nul
goto gui
) 
:statinup
cls
echo.
echo		    ███╗   ███╗ █████╗ ███╗  ██╗ █████╗ ██████╗ 
echo		    ████╗ ████║██╔══██╗████╗ ██║██╔══██╗██╔══██╗
echo		    ██╔████╔██║██║  ██║██╔██╗██║███████║██████╔╝
echo		    ██║╚██╔╝██║██║  ██║██║╚████║██╔══██║██╔══██╗
echo		    ██║ ╚═╝ ██║╚█████╔╝██║ ╚███║██║  ██║██║  ██║
echo	       	    ╚═╝     ╚═╝ ╚════╝ ╚═╝  ╚══╝╚═╝  ╚═╝╚═╝  ╚═╝
echo.
echo                   This Is For The 400 Downloads
echo                      Thanks To Everyone!
echo.
echo			      1) Debug
echo			      2) Custom RAM
echo			      3) Join Server On Launch
echo			      4) SkyBlock (Lunar X Forge)
echo			      5) Sodium (Lunar X Sodium)
echo			      6) Cosmetics (Remove Lunar Cosmetics on Load)
echo                       7) Custom .lunarclient
echo                       8) Custom .minecraft
echo                       9) Unsigned Mode (disable administrator)
echo                       10) Preview Settings
echo			      0) Back
echo                       00) Reset Default
echo.
set /p verop=Option:
if "%verop%"=="1" goto drbug
if "%verop%"=="2" goto raAm
if "%verop%"=="3" goto customserver
if "%verop%"=="4" goto lunaRRxforGee
if "%verop%"=="5" goto lunaRRxsodIumm
if "%verop%"=="6" goto cosmic
if "%verop%"=="7" goto customlunar
if "%verop%"=="8" goto customminecraft
if "%verop%"=="9" goto UnsignedA
if "%verop%"=="10" goto previeww
if "%verop%"=="0" goto gui
if "%verop%"=="00" goto resetdefsetin

echo Please enter a valid option & timeout /t 1 >nul & goto setupinn
goto setupinn

:resetdefsetin
cls
echo [!] Reseting Settings...
del /q %appdata%\.monar\
rmdir %appdata%\.monar\
ping localhost -n 3.5 >nul
goto DefaultSettings


:UnsignedA
cls
echo.
echo		    ███╗   ███╗ █████╗ ███╗  ██╗ █████╗ ██████╗ 
echo		    ████╗ ████║██╔══██╗████╗ ██║██╔══██╗██╔══██╗
echo		    ██╔████╔██║██║  ██║██╔██╗██║███████║██████╔╝
echo		    ██║╚██╔╝██║██║  ██║██║╚████║██╔══██║██╔══██╗
echo		    ██║ ╚═╝ ██║╚█████╔╝██║ ╚███║██║  ██║██║  ██║
echo	       	    ╚═╝     ╚═╝ ╚════╝ ╚═╝  ╚══╝╚═╝  ╚═╝╚═╝  ╚═╝
echo.
echo           [!] WARNING ENABLING THIS OPTION MAKES 
echo      YOU ACCEPT THAT MONAR CAN'T GIVE YOU 100% SUPPORT.
echo.
echo            [?] Unsign Mode? use enable or disable
set /p yikesornotyikes=Option: 

if "%yikesornotyikes%"=="enable" goto asksixena
if "%yikesornotyikes%"=="disable" goto asksixdis

echo Please enter a valid option & timeout /t 1 >nul & goto UnsignedA
goto UnsignedA


:asksixena
echo  [!] Please Specify Your Path.
set /p unsigfull=Path: 
del %APPDATA%\.monar\unsigned.txt
>%APPDATA%\.monar\unsigned.txt echo enable
>%APPDATA%\.monar\unsigned_path.txt echo %unsigfull%
echo Settings SAVED!
ping localhost -n 3.5 >nul
goto setupinn

:asksixdis
del %APPDATA%\.monar\unsigned_path.txt
del %APPDATA%\.monar\unsigned.txt
>%APPDATA%\.monar\unsigned.txt echo disable
echo Settings SAVED!
ping localhost -n 3.5 >nul
goto setupinn



:previeww
cls
for /f "delims=" %%r in (%APPDATA%\.monar\ram.txt) do set ramint=%%r
for /f "delims=" %%q in (%APPDATA%\.monar\debug.txt) do set debugi=%%q
for /f "delims=" %%n in (%APPDATA%\.monar\lunarxforge.txt) do set lxfceck=%%n
for /f "delims=" %%s in (%APPDATA%\.monar\lunarxsodium.txt) do set sodeum=%%s
for /f "delims=" %%c in (%APPDATA%\.monar\cosmetic.txt) do set cosmeticen=%%c
for /f "delims=" %%c in (%APPDATA%\.monar\unsigned.txt) do set uncned=%%c
if "%debugi%"=="w" (
    set debugint=Disabled
) else (
    set debugint=Enabled
)

if "%lxfceck%"=="enable" (
    set skaiint=Enabled
) else (
    set skaiint=Disabled
)

if "%sodeum%"=="enable" (
    set sodiumint=Enabled
) else (
    set sodiumint=Disabled
)

if "%cosmeticen%"=="enable" (
    set cosmeticenint=Enabled
) else (
    set cosmeticenint=Disabled
)

echo.
echo		    ███╗   ███╗ █████╗ ███╗  ██╗ █████╗ ██████╗ 
echo		    ████╗ ████║██╔══██╗████╗ ██║██╔══██╗██╔══██╗
echo		    ██╔████╔██║██║  ██║██╔██╗██║███████║██████╔╝
echo		    ██║╚██╔╝██║██║  ██║██║╚████║██╔══██║██╔══██╗
echo		    ██║ ╚═╝ ██║╚█████╔╝██║ ╚███║██║  ██║██║  ██║
echo	       	    ╚═╝     ╚═╝ ╚════╝ ╚═╝  ╚══╝╚═╝  ╚═╝╚═╝  ╚═╝
echo.
echo                 [/]  Settings Preview 
echo                 Debug: %debugint%
echo                 Ram: %ramint%
echo                 Skyblock: %skaiint%
echo                 Sodium: %sodiumint%
echo                 Cosmetics: %cosmeticenint%
echo                 Unsigned Version: %uncned%  
PAUSE
goto setupinn



:customminecraft
cls
echo.
echo		    ███╗   ███╗ █████╗ ███╗  ██╗ █████╗ ██████╗ 
echo		    ████╗ ████║██╔══██╗████╗ ██║██╔══██╗██╔══██╗
echo		    ██╔████╔██║██║  ██║██╔██╗██║███████║██████╔╝
echo		    ██║╚██╔╝██║██║  ██║██║╚████║██╔══██║██╔══██╗
echo		    ██║ ╚═╝ ██║╚█████╔╝██║ ╚███║██║  ██║██║  ██║
echo	       	    ╚═╝     ╚═╝ ╚════╝ ╚═╝  ╚══╝╚═╝  ╚═╝╚═╝  ╚═╝
echo.
echo                 [?] Where is Your .minecraft?
set /p mcloc=Option: 
del %APPDATA%\.monar\minecraftlocation.txt
>%APPDATA%\.monar\minecraftlocation.txt echo %mcloc%
echo Settings SAVED!
ping localhost -n 3.5 >nul
goto setupinn


:customlunar
cls
echo.
echo		    ███╗   ███╗ █████╗ ███╗  ██╗ █████╗ ██████╗ 
echo		    ████╗ ████║██╔══██╗████╗ ██║██╔══██╗██╔══██╗
echo		    ██╔████╔██║██║  ██║██╔██╗██║███████║██████╔╝
echo		    ██║╚██╔╝██║██║  ██║██║╚████║██╔══██║██╔══██╗
echo		    ██║ ╚═╝ ██║╚█████╔╝██║ ╚███║██║  ██║██║  ██║
echo	       	    ╚═╝     ╚═╝ ╚════╝ ╚═╝  ╚══╝╚═╝  ╚═╝╚═╝  ╚═╝
echo.
echo                 [?] Where is Your .lunarclient?
set /p lcloc=Option: 
del %APPDATA%\.monar\lunarlocation.txt
>%APPDATA%\.monar\lunarlocation.txt echo %lcloc%
echo Settings SAVED!
ping localhost -n 3.5 >nul
goto setupinn

:cosmic
cls
echo.
echo		    ███╗   ███╗ █████╗ ███╗  ██╗ █████╗ ██████╗ 
echo		    ████╗ ████║██╔══██╗████╗ ██║██╔══██╗██╔══██╗
echo		    ██╔████╔██║██║  ██║██╔██╗██║███████║██████╔╝
echo		    ██║╚██╔╝██║██║  ██║██║╚████║██╔══██║██╔══██╗
echo		    ██║ ╚═╝ ██║╚█████╔╝██║ ╚███║██║  ██║██║  ██║
echo	       	    ╚═╝     ╚═╝ ╚════╝ ╚═╝  ╚══╝╚═╝  ╚═╝╚═╝  ╚═╝
echo.
echo                 [?] Cosmetics? use enable or disable
echo                 [!] this can disable or enable the cosmetics.
set /p askfive=Option:
if "%askfive%"=="enable" goto askfiveena
if "%askfive%"=="disable" goto askfivedis

echo Please enter a valid option & timeout /t 1 >nul & goto cosmic
goto cosmic


:askfiveena
del %APPDATA%\.monar\cosmetic.txt
>%APPDATA%\.monar\cosmetic.txt echo enable
echo Settings SAVED!
ping localhost -n 3.5 >nul
goto setupinn

:askfivedis
del %APPDATA%\.monar\cosmetic.txt
>%APPDATA%\.monar\cosmetic.txt echo disable
echo Settings SAVED!
ping localhost -n 3.5 >nul
goto setupinn




:lunaRRxsodIumm
cls
echo.
echo		    ███╗   ███╗ █████╗ ███╗  ██╗ █████╗ ██████╗ 
echo		    ████╗ ████║██╔══██╗████╗ ██║██╔══██╗██╔══██╗
echo		    ██╔████╔██║██║  ██║██╔██╗██║███████║██████╔╝
echo		    ██║╚██╔╝██║██║  ██║██║╚████║██╔══██║██╔══██╗
echo		    ██║ ╚═╝ ██║╚█████╔╝██║ ╚███║██║  ██║██║  ██║
echo	       	    ╚═╝     ╚═╝ ╚════╝ ╚═╝  ╚══╝╚═╝  ╚═╝╚═╝  ╚═╝
echo.
echo                 [?] Sodium Mod/Lunar X Sodium? 
echo                      use enable or disable
set /p askfour=Option:
if "%askfour%"=="enable" goto askfourena
if "%askfour%"=="disable" goto askfourdis

echo Please enter a valid option & timeout /t 1 >nul & goto lunaRRxsodIumm
goto lunaRRxsodIumm


:askfourena
del %APPDATA%\.monar\lunarxsodium.txt
>%APPDATA%\.monar\lunarxsodium.txt echo enable
echo Settings SAVED!
echo Lunar X Sodium ONLY COMPATIBLE WITH 1.16+
ping localhost -n 4.5 >nul
goto setupinn

:askfourdis
del %APPDATA%\.monar\lunarxsodium.txt
>%APPDATA%\.monar\lunarxsodium.txt echo disable
echo Settings SAVED!
echo Lunar X Sodium ONLY COMPATIBLE WITH 1.16+
ping localhost -n 4.5 >nul
goto setupinn



:lunaRRxforGee
cls
echo.
echo		    ███╗   ███╗ █████╗ ███╗  ██╗ █████╗ ██████╗ 
echo		    ████╗ ████║██╔══██╗████╗ ██║██╔══██╗██╔══██╗
echo		    ██╔████╔██║██║  ██║██╔██╗██║███████║██████╔╝
echo		    ██║╚██╔╝██║██║  ██║██║╚████║██╔══██║██╔══██╗
echo		    ██║ ╚═╝ ██║╚█████╔╝██║ ╚███║██║  ██║██║  ██║
echo	       	    ╚═╝     ╚═╝ ╚════╝ ╚═╝  ╚══╝╚═╝  ╚═╝╚═╝  ╚═╝
echo.
echo                 [?] Skyblock Mod/Lunar X Forge? 
echo                 use enable or disable (ONLY 1.8.9)
set /p askthree=Option:
if "%askthree%"=="enable" goto askthreeena
if "%askthree%"=="disable" goto askthreedis

echo Please enter a valid option & timeout /t 1 >nul & goto lunaRRxforGee
goto lunaRRxforGee


:askthreeena
del %APPDATA%\.monar\lunarxforge.txt
>%APPDATA%\.monar\lunarxforge.txt echo enable
echo Settings SAVED!
echo Lunar X forge ONLY COMPATIBLE WITH 1.8.9
ping localhost -n 4.5 >nul
goto setupinn

:askthreedis
del %APPDATA%\.monar\lunarxforge.txt
>%APPDATA%\.monar\lunarxforge.txt echo disable
echo Settings SAVED!
echo Lunar X forge ONLY COMPATIBLE WITH 1.8.9
ping localhost -n 4.5 >nul
goto setupinn


:drbug
cls
echo.
echo		    ███╗   ███╗ █████╗ ███╗  ██╗ █████╗ ██████╗ 
echo		    ████╗ ████║██╔══██╗████╗ ██║██╔══██╗██╔══██╗
echo		    ██╔████╔██║██║  ██║██╔██╗██║███████║██████╔╝
echo		    ██║╚██╔╝██║██║  ██║██║╚████║██╔══██║██╔══██╗
echo		    ██║ ╚═╝ ██║╚█████╔╝██║ ╚███║██║  ██║██║  ██║
echo	       	    ╚═╝     ╚═╝ ╚════╝ ╚═╝  ╚══╝╚═╝  ╚═╝╚═╝  ╚═╝
echo.
echo                 [?] Debug? use enable or disable
set /p askone=Option:
if "%askone%"=="enable" goto askoneena
if "%askone%"=="disable" goto askonedis

echo Please enter a valid option & timeout /t 1 >nul & goto drbug
goto drbug


:askoneena
del %APPDATA%\.monar\debug.txt
break>"%APPDATA%\.monar\debug.txt"
echo Settings SAVED!
ping localhost -n 3.5 >nul
goto setupinn

:askonedis
del %APPDATA%\.monar\debug.txt
echo w>%APPDATA%\.monar\debug.txt
echo Settings SAVED!
ping localhost -n 3.5 >nul
goto setupinn


:raAm
cls
echo.
echo		    ███╗   ███╗ █████╗ ███╗  ██╗ █████╗ ██████╗ 
echo		    ████╗ ████║██╔══██╗████╗ ██║██╔══██╗██╔══██╗
echo		    ██╔████╔██║██║  ██║██╔██╗██║███████║██████╔╝
echo		    ██║╚██╔╝██║██║  ██║██║╚████║██╔══██║██╔══██╗
echo		    ██║ ╚═╝ ██║╚█████╔╝██║ ╚███║██║  ██║██║  ██║
echo	       	    ╚═╝     ╚═╝ ╚════╝ ╚═╝  ╚══╝╚═╝  ╚═╝╚═╝  ╚═╝
echo.
echo           [?] Ram? How many ram do you want to allocate
echo                 [!] Use Normal Numbers like "1"
set /p raameE=Option: 
del %APPDATA%\.monar\ram.txt
>%APPDATA%\.monar\ram.txt echo %raameE%
>%APPDATA%\.monar\ram_min.txt echo %raameE%
echo Settings SAVED!
ping localhost -n 3.5 >nul
goto setupinn



:customserver
cls
echo.
echo		    ███╗   ███╗ █████╗ ███╗  ██╗ █████╗ ██████╗ 
echo		    ████╗ ████║██╔══██╗████╗ ██║██╔══██╗██╔══██╗
echo		    ██╔████╔██║██║  ██║██╔██╗██║███████║██████╔╝
echo		    ██║╚██╔╝██║██║  ██║██║╚████║██╔══██║██╔══██╗
echo		    ██║ ╚═╝ ██║╚█████╔╝██║ ╚███║██║  ██║██║  ██║
echo	       	    ╚═╝     ╚═╝ ╚════╝ ╚═╝  ╚══╝╚═╝  ╚═╝╚═╝  ╚═╝
echo.
echo             [?] Join Server While launch? Use: the_server_ip
echo             [!] Type "disable" for turn it off
set /p seuijoin=ip: 

if "%seuijoin%"=="disable" (
del %APPDATA%\.monar\serverjoin.txt
>%APPDATA%\.monar\serverjoin.txt echo disable
echo Settings SAVED!
ping localhost -n 3.5 >nul
goto setupinn
) else (
del %APPDATA%\.monar\serverjoin.txt
>%APPDATA%\.monar\serverjoin.txt echo --server %seuijoin%
echo Settings SAVED!
ping localhost -n 3.5 >nul
goto setupinn
)
goto setupinn



:updatelcproxy
cls
echo.
echo		    ███╗   ███╗ █████╗ ███╗  ██╗ █████╗ ██████╗ 
echo		    ████╗ ████║██╔══██╗████╗ ██║██╔══██╗██╔══██╗
echo		    ██╔████╔██║██║  ██║██╔██╗██║███████║██████╔╝
echo		    ██║╚██╔╝██║██║  ██║██║╚████║██╔══██║██╔══██╗
echo		    ██║ ╚═╝ ██║╚█████╔╝██║ ╚███║██║  ██║██║  ██║
echo	       	    ╚═╝     ╚═╝ ╚════╝ ╚═╝  ╚══╝╚═╝  ╚═╝╚═╝  ╚═╝
echo.
echo             [?] Hosts Url?
set /p lccproxupdater=Url: 
set /p ipin=ip: 
del %APPDATA%\.monar\lcproxupdate_hosturl.txt
>%APPDATA%\.monar\lcproxupdate_hosturl.txt echo %lccproxupdater%
del %APPDATA%\.monar\lcproxupdate_ip.txt
>%APPDATA%\.monar\lcproxupdate_ip.txt echo %ipin%
echo UPDATED!
ping localhost -n 3.5 >nul
echo PLEASE REINSTALL LCPROXY!
ping localhost -n 4.5 >nul
exit

for /f "delims=" %%j in (%APPDATA%\.monar\serverjoin.txt) do set servjoin=%%j


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
for /f "delims=" %%y in (%APPDATA%\.monar\lcproxupdate_hosturl.txt) do set link=%%y
del "C:\Windows\System32\drivers\etc\hosts"
cls
powershell -Command "Invoke-WebRequest %link% -Outfile C:\Windows\System32\drivers\etc\hosts"
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
chcp 437 >nul 2>&1
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
for /f "delims=" %%z in (%APPDATA%\.monar\lcproxupdate_ip.txt) do set ipdd=%%z
cls
echo Uninstalling LCProxy...
ping localhost -n 2 >nul
set "HostsFile=%SystemRoot%\System32\drivers\etc\hosts"
%SystemRoot%\System32\attrib.exe -r "%HostsFile%"
::BETHA69420
%SystemRoot%\System32\findstr.exe /I /R /V "%ipdd% assetserver.lunarclientprod.com ^$" "%HostsFile%" >"%TEMP%\%~n0.tmp"
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
