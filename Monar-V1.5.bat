echo off
mode con lines=30 cols=68
:VerionCheck
set actualver=1.5
set version=1.5
set vrs=%version%

for /f "delims=" %%h in (%APPDATA%\monar_version\versionload.txt) do set verchecks=%%h
if exist "%APPDATA%\monar_version\versionload.txt" (
    set notimportant=aa
) else (
    goto SetupMonar
)


if "%verchecks%"=="%actualver%" (
goto DefaultSettings
) else (
    echo [!] Old/Different Version Detected!
    ping localhost -n 3.5 >nul
    cls
    echo [!] Reseting Launcher...
    del /q %appdata%\.monar\
    rmdir %appdata%\.monar\
    if exist "%appdata\.monar\agents%" (
        del /q %appdata%\.monar\agents\option_data
        del /q %appdata%\.monar\agents\name_data
        del /q %appdata%\.monar\agents\command_data
        del /q %appdata%\.monar\agents\switch_data
        del /q %appdata%\.monar\agents
        rmdir %appdata%\.monar\agents\option_data
        rmdir %appdata%\.monar\agents\name_data
        rmdir %appdata%\.monar\agents\command_data
        rmdir %appdata%\.monar\agents\switch_data
        rmdir %appdata%\.monar\agents
        )
ping localhost -n 3.5 >nul
goto SetupMonar
)

:SetupMonar
chcp 65001 >nul 2>&1
title Monar Launcher V%actualver% / Setup
cls
echo.
echo		    ███╗   ███╗ █████╗ ███╗  ██╗ █████╗ ██████╗ 
echo		    ████╗ ████║██╔══██╗████╗ ██║██╔══██╗██╔══██╗
echo		    ██╔████╔██║██║  ██║██╔██╗██║███████║██████╔╝
echo		    ██║╚██╔╝██║██║  ██║██║╚████║██╔══██║██╔══██╗
echo		    ██║ ╚═╝ ██║╚█████╔╝██║ ╚███║██║  ██║██║  ██║
echo	       	    ╚═╝     ╚═╝ ╚════╝ ╚═╝  ╚══╝╚═╝  ╚═╝╚═╝  ╚═╝
echo.
echo                [!] Welcome To Monar Launcher!
echo                    Please Specify Your Path.
set /p setuppath=Path:
ping localhost -n 1.5 >nul
cls
echo                        ______________________
echo                       ┃  Installing Monar... ┃
echo                        ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
ping localhost -n 3.5 >nul
goto DefaultSettings

:DefaultSettings
cls
if exist "%appdata%\.monar" (
goto DefaultSettingsVAgents
) else (
echo                        ______________________
echo                       ┃  Creating Settings.. ┃
echo                        ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
mkdir %APPDATA%\".monar"
mkdir %APPDATA%\"monar_version"
>%APPDATA%\monar_version\versionload.txt echo %actualver%
echo w>%APPDATA%\.monar\debug.txt
>%APPDATA%\.monar\ram_min.txt echo 1
>%APPDATA%\.monar\ram.txt echo 3
>%APPDATA%\.monar\lcproxupdate_ip.txt echo 143.198.116.11
>%APPDATA%\.monar\lcproxupdate_hosturl.txt echo https://cdn.discordapp.com/attachments/996966993733357689/1067881136124076212/hosts
>%APPDATA%\.monar\serverjoin.txt echo disable
>%APPDATA%\.monar\lunarxforge.txt echo disable
>%APPDATA%\.monar\lunarxsodium.txt echo disable
>%APPDATA%\.monar\path.txt echo %setuppath%
>%APPDATA%\.monar\cosmetic.txt echo enable
>%APPDATA%\.monar\minecraftlocation.txt echo %appdata%\.minecraft
>%APPDATA%\.monar\lunarlocation.txt echo %userprofile%\.lunarclient
cls
echo                        ______________________
echo                       ┃   Settings Created!  ┃
echo                        ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
ping localhost -n 3.5 >nul
goto DefaultSettingsVAgents
)

:DefaultSettingsVAgents
cls
if exist "%APPDATA%\.monar\agents" (
    goto gui
) else (
    echo                        ______________________
    echo                       ┃ Creating Agents Data ┃
    echo                        ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
    mkdir %APPDATA%\".monar\agents"
    mkdir %APPDATA%\".monar\agents\option_data"
    mkdir %APPDATA%\".monar\agents\switch_data"
    >%appdata%\.monar\agents\switch_data\agent_1_data.txt echo NoData
    >%appdata%\.monar\agents\switch_data\agent_2_data.txt echo NoData
    >%appdata%\.monar\agents\switch_data\agent_3_data.txt echo NoData
    >%appdata%\.monar\agents\switch_data\agent_4_data.txt echo NoData
    >%appdata%\.monar\agents\switch_data\agent_5_data.txt echo NoData
    break>"%appdata%\.monar\agents\option_data\agent_1_data.txt
    break>"%appdata%\.monar\agents\option_data\agent_2_data.txt
    break>"%appdata%\.monar\agents\option_data\agent_3_data.txt
    break>"%appdata%\.monar\agents\option_data\agent_4_data.txt
    break>"%appdata%\.monar\agents\option_data\agent_5_data.txt
    mkdir %APPDATA%\".monar\agents\name_data"
    >%appdata%\.monar\agents\name_data\agent_1_data.txt echo Agent Slot 1
    >%appdata%\.monar\agents\name_data\agent_2_data.txt echo Agent Slot 2
    >%appdata%\.monar\agents\name_data\agent_3_data.txt echo Agent Slot 3
    >%appdata%\.monar\agents\name_data\agent_4_data.txt echo Agent Slot 4
    >%appdata%\.monar\agents\name_data\agent_5_data.txt echo Agent Slot 5
    mkdir %APPDATA%\".monar\agents\command_data"
    ping localhost -n 3.5 >nul
    cls
    echo                        ______________________
    echo                       ┃ Agents Data Created! ┃
    echo                        ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
    ping localhost -n 3.5 >nul
)


:gui
cls
chcp 65001 >nul 2>&1
title Monar Launcher V%vrs% / Menu
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
echo				2) Settings
echo                         3) Addons
echo                         4) TroubleShoot
echo.
set /p op=Option:
if "%op%"=="1" goto launcher
if "%op%"=="2" goto setupinn
if "%op%"=="3" goto addonz
if "%op%"=="4" goto cokcheck

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
echo				2) Java Agents
echo				0) Back
set /p opititi=Option:
if "%opititi%"=="0" goto gui
if "%opititi%"=="1" goto lcproxy
if "%opititi%"=="2" goto jvagentmenui

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
if "%opitk%"=="0" goto addonz
if "%opitk%"=="1" goto basic
if "%opitk%"=="2" goto uninstall
if "%opitk%"=="3" goto updatelcproxy

echo Please enter a valid option & timeout /t 1 >nul & goto lcproxy
goto lcproxy


:launcher
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
echo                         Welcome back!
echo.
echo                       Select a Version:
echo			         1) 1.7.10
echo			         2) 1.8.9
echo			         3) 1.12.2
echo			         4) 1.16.5
echo			         5) 1.17.1
echo			         6) 1.18.X
echo                          7) 1.19.X
echo			         0) Back
echo.
set /p verop=Version:
if "%verop%"=="1" goto 1.7.10
if "%verop%"=="2" goto 1.8.9
if "%verop%"=="3" goto 1.12.2
if "%verop%"=="4" goto 1.16.5
if "%verop%"=="5" goto 1.17.1
if "%verop%"=="6" goto 1.18
if "%verop%"=="7" goto 1.19s
if "%verop%"=="0" goto gui 

echo Please enter a valid option & timeout /t 1 >nul & goto launcher
goto installcp


::Message
:messagefor
echo                        ______________________
echo                       ┃   Process Created!   ┃
echo                        ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
ping localhost -n 3.5 >nul
cls
echo                        ______________________
echo                       ┃  Checking Process... ┃
echo                        ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
ping localhost -n 3.5 >nul
goto drippcheck

::Process Check Core
:drippcheck
if "%debugi%"=="w" (
    set prosschang=javaw
) else (
    set prosschang=java
)

if "%prosschang%"=="java" (
    cls
    echo                        ______________________
    echo                       ┃  Debugging Detected! ┃
    echo                        ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
    ping localhost -n 4.5 >nul
    exit
) else (
    set notimportant=0
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
echo            Please Report The Error At the Discord For Help
echo               Remmeber to have Installed That version!
ping localhost -n 6.7 >nul
goto launcher

:continueesi
cls
echo                        ______________________
echo                       ┃   Process Working!   ┃
echo                        ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
ping localhost -n 4.0 >nul
cls
echo                        ______________________
echo                       ┃  Preparing Launch... ┃
echo                        ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
ping localhost -n 4.5 >nul

:launching
cls
echo                        ______________________
echo                       ┃     Launching        ┃
echo                        ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
ping localhost -n 2.75 >nul
cls
echo                        ______________________
echo                       ┃     Launching.       ┃
echo                        ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
ping localhost -n 2.75 >nul
cls
echo                        ______________________
echo                       ┃     Launching..      ┃
echo                        ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
ping localhost -n 2.75 >nul
cls
echo                        ______________________
echo                       ┃     Launching...     ┃
echo                        ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
ping localhost -n 2.75 >nul
cls
echo                        ______________________
echo                       ┃       Launched!      ┃
echo                        ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
ping localhost -n 3.5 >nul
exit

:SettingsLoad
:: AGENTS RESOURCES
for /f "delims=" %%k in (%appdata%\.monar\agents\switch_data\agent_1_data.txt) do set comdotagent1=%%k

if "%comdotagent1%"=="enable" (
    for /f "delims=" %%a in (%appdata%\.monar\agents\command_data\agent_1_data.txt) do set agentcom1=%%a

) else (
    set agentcom1=
)


for /f "delims=" %%k in (%appdata%\.monar\agents\switch_data\agent_2_data.txt) do set comdotagent2=%%k

if "%comdotagent2%"=="enable" (
    for /f "delims=" %%a in (%appdata%\.monar\agents\command_data\agent_2_data.txt) do set agentcom2=%%a
    
) else (
    set agentcom2=
)


for /f "delims=" %%k in (%appdata%\.monar\agents\switch_data\agent_3_data.txt) do set comdotagent3=%%k

if "%comdotagent3%"=="enable" (
    for /f "delims=" %%a in (%appdata%\.monar\agents\command_data\agent_3_data.txt) do set agentcom3=%%a
    
) else (
    set agentcom3=
)


for /f "delims=" %%k in (%appdata%\.monar\agents\switch_data\agent_4_data.txt) do set comdotagent4=%%k

if "%comdotagent4%"=="enable" (
    for /f "delims=" %%a in (%appdata%\.monar\agents\command_data\agent_4_data.txt) do set agentcom4=%%a
    
) else (
    set agentcom4=
)


for /f "delims=" %%k in (%appdata%\.monar\agents\switch_data\agent_5_data.txt) do set comdotagent5=%%k

if "%comdotagent5%"=="enable" (
    for /f "delims=" %%a in (%appdata%\.monar\agents\command_data\agent_5_data.txt) do set agentcom5=%%a
    
) else (
    set agentcom5=
)

if "%comdotagent1%"=="enable" (
    for /f "delims=" %%a in (%appdata%\.monar\agents\option_data\agent_1_data.txt) do set optionagentcom1=%%a
) else (
    set optionagentcom1=
)


if "%comdotagent2%"=="enable" (
    for /f "delims=" %%a in (%appdata%\.monar\agents\option_data\agent_2_data.txt) do set optionagentcom2=%%a
) else (
    set optionagentcom2=
)

if "%comdotagent3%"=="enable" (
    for /f "delims=" %%a in (%appdata%\.monar\agents\option_data\agent_3_data.txt) do set optionagentcom3=%%a
) else (
    set optionagentcom3=
)

if "%comdotagent4%"=="enable" (
    for /f "delims=" %%a in (%appdata%\.monar\agents\option_data\agent_4_data.txt) do set optionagentcom4=%%a
) else (
    set optionagentcom4=
)

if "%comdotagent5%"=="enable" (
    for /f "delims=" %%a in (%appdata%\.monar\agents\option_data\agent_5_data.txt) do set optionagentcom5=%%a
) else (
    set optionagentcom5=
)
:: AGENTS RESOURCES END

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
set Args=-Xms%ramn%G -Xmx%ramn%G -Xmn%ramm%G -XX:+UnlockExperimentalVMOptions -XX:+UseG1GC -XX:G1NewSizePercent=20 -XX:G1ReservePercent=20 -XX:MaxGCPauseMillis=50 -XX:G1HeapRegionSize=32M -XX:+AlwaysActAsServerClassMachine -XX:MaxTenuringThreshold=1 -XX:SurvivorRatio=32 -XX:G1HeapRegionSize=8M -XX:GCTimeLimit=50 -XX:G1MixedGCCountTarget=4 -XX:G1MixedGCLiveThresholdPercent=90 -XX:-UsePerfData -XX:+PerfDisableSharedMem -XX:+AlwaysPreTouch -XX:+EliminateLocks -XX:+EagerJVMCI %agentcom1%%optionagentcom1% %agentcom2%%optionagentcom2% %agentcom3%%optionagentcom3% %agentcom4%%optionagentcom4% %agentcom5%%optionagentcom5%
for /f "delims=" %%x in (%APPDATA%\.monar\path.txt) do set pather=%%x



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


if "%mcvrs%"=="1.7.10" (
    goto load0
) else (
    goto loadd1
)


:loadd1
if "%mcvrs%"=="1.8.9" (
    goto load1
) else (
    goto loadd2
)

:loadd2
if "%mcvrs%"=="1.12.2" (
    goto load2
) else (
    cls
    echo FATAL ERROR REPORT TO THE DISCORD!
    ping localhost -n 88.5 >nul
)


:SettingsLoadTWO
:: AGENTS RESOURCES
for /f "delims=" %%k in (%appdata%\.monar\agents\switch_data\agent_1_data.txt) do set comdotagent1=%%k

if "%comdotagent1%"=="enable" (
    for /f "delims=" %%a in (%appdata%\.monar\agents\command_data\agent_1_data.txt) do set agentcom1=%%a

) else (
    set agentcom1=
)


for /f "delims=" %%k in (%appdata%\.monar\agents\switch_data\agent_2_data.txt) do set comdotagent2=%%k

if "%comdotagent2%"=="enable" (
    for /f "delims=" %%a in (%appdata%\.monar\agents\command_data\agent_2_data.txt) do set agentcom2=%%a
    
) else (
    set agentcom2=
)


for /f "delims=" %%k in (%appdata%\.monar\agents\switch_data\agent_3_data.txt) do set comdotagent3=%%k

if "%comdotagent3%"=="enable" (
    for /f "delims=" %%a in (%appdata%\.monar\agents\command_data\agent_3_data.txt) do set agentcom3=%%a
    
) else (
    set agentcom3=
)


for /f "delims=" %%k in (%appdata%\.monar\agents\switch_data\agent_4_data.txt) do set comdotagent4=%%k

if "%comdotagent4%"=="enable" (
    for /f "delims=" %%a in (%appdata%\.monar\agents\command_data\agent_4_data.txt) do set agentcom4=%%a
    
) else (
    set agentcom4=
)


for /f "delims=" %%k in (%appdata%\.monar\agents\switch_data\agent_5_data.txt) do set comdotagent5=%%k

if "%comdotagent5%"=="enable" (
    for /f "delims=" %%a in (%appdata%\.monar\agents\command_data\agent_5_data.txt) do set agentcom5=%%a
    
) else (
    set agentcom5=
)

if "%comdotagent1%"=="enable" (
    for /f "delims=" %%a in (%appdata%\.monar\agents\option_data\agent_1_data.txt) do set optionagentcom1=%%a
) else (
    set optionagentcom1=
)


if "%comdotagent2%"=="enable" (
    for /f "delims=" %%a in (%appdata%\.monar\agents\option_data\agent_2_data.txt) do set optionagentcom2=%%a
) else (
    set optionagentcom2=
)

if "%comdotagent3%"=="enable" (
    for /f "delims=" %%a in (%appdata%\.monar\agents\option_data\agent_3_data.txt) do set optionagentcom3=%%a
) else (
    set optionagentcom3=
)

if "%comdotagent4%"=="enable" (
    for /f "delims=" %%a in (%appdata%\.monar\agents\option_data\agent_4_data.txt) do set optionagentcom4=%%a
) else (
    set optionagentcom4=
)

if "%comdotagent5%"=="enable" (
    for /f "delims=" %%a in (%appdata%\.monar\agents\option_data\agent_5_data.txt) do set optionagentcom5=%%a
) else (
    set optionagentcom5=
)
:: AGENTS RESOURCES END

for /f "delims=" %%s in (%APPDATA%\.monar\lunarxsodium.txt) do set sodeum=%%s
if "%sodeum%"=="enable" (
    set icheerone=--ichorExternalFiles Phosphor_v%verifthe%.jar;Sodium_v%verifthe%.jar;Iris_v%verifthe%.jar;Indium_v%verifthe%.jar
    set sodone=modern-0.1.0-SNAPSHOT-all.jar;common-0.1.0-SNAPSHOT-all.jar;argon-0.1.0-SNAPSHOT-all.jar
    set sodtwo=genesis-0.1.0-SNAPSHOT-all.jar;fabric-0.1.0-SNAPSHOT-all.jar;fabric-0.1.0-SNAPSHOT-v%verifthe%.jar
    set ifsodtree=;sodium-0.1.0-SNAPSHOT-all.jar
) else (
    set icheerone=--ichorExternalFiles OptiFine_v%verifthe%.jar
    set sodone=modern-0.1.0-SNAPSHOT-all.jar;common-0.1.0-SNAPSHOT-all.jar
    set sodtwo=optifine-0.1.0-SNAPSHOT-all.jar;genesis-0.1.0-SNAPSHOT-all.jar
    set ifsodtree=
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
set Args=-Xms%ramn%G -Xmx%ramn%G -Xmn%ramm%G -XX:+UnlockExperimentalVMOptions -XX:+UseG1GC -XX:G1NewSizePercent=20 -XX:G1ReservePercent=20 -XX:MaxGCPauseMillis=50 -XX:G1HeapRegionSize=32M -XX:+AlwaysActAsServerClassMachine -XX:MaxTenuringThreshold=1 -XX:SurvivorRatio=32 -XX:G1HeapRegionSize=8M -XX:GCTimeLimit=50 -XX:G1MixedGCCountTarget=4 -XX:G1MixedGCLiveThresholdPercent=90 -XX:-UsePerfData -XX:+PerfDisableSharedMem -XX:+AlwaysPreTouch -XX:+EliminateLocks -XX:+EagerJVMCI %agentcom1%%optionagentcom1% %agentcom2%%optionagentcom2% %agentcom3%%optionagentcom3% %agentcom4%%optionagentcom4% %agentcom5%%optionagentcom5%

for /f "delims=" %%x in (%APPDATA%\.monar\path.txt) do set pather=%%x
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
if "%mcvrs%"=="1.16.5" (
    goto load3
) else (
    goto loadd4
)

:loadd4
if "%mcvrs%"=="1.17.1" (
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
    goto loadd9
)

:loadd9
if "%mcvrs%"=="1.19.3" (
    goto load9
) else (
    goto loadd10
)

:loadd10
if "%mcvrs%"=="1.19.4" (
    goto load10
) else (
    cls
    echo [!] FATAL ERROR PLEASE REPORT TO DISCORD!
    echo [!] ERROR CODE: No Finded Version Requested
    ping localhost -n 88.5 >nul
)





:1.7.10
cls
set mcvrs=1.7.10
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
goto messagefor









:1.8.9
cls
set mcvrs=1.8.9
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
goto messagefor









:1.12.2
cls
set mcvrs=1.12.2
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
goto messagefor






:1.16.5
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
goto messagefor






:1.17.1
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
goto messagefor




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
if "%verop2%"=="0" goto launcher
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
goto messagefor










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
goto messagefor









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
echo                       Select a Version:
echo			      1) 1.19
echo			      2) 1.19.2
echo			      3) 1.19.3
echo                       4) 1.19.4
echo			      0) Back
set /p verop3=Version:
if "%verop3%"=="0" goto launcher
if "%verop3%"=="1" goto 1.19
if "%verop3%"=="2" goto 1.19.2
if "%verop3%"=="3" goto 1.19.3
if "%verop3%"=="4" goto 1.19.4


echo Please enter a valid option & timeout /t 1 >nul & goto 1.19s
goto 1.19s




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
goto messagefor







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
goto messagefor


:1.19.3
cls
set verifthe=1_19_3
set mcvrs=1.19.3
set indextt=1.19
title Monar Launcher V%vrs% / %mcvrs%
echo                        ______________________
echo                       ┃  Creating Process... ┃
echo                        ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
ping localhost -n 3.5 >nul
goto SettingsLoadTWO

:load9
cd %scd%\offline\multiver
::sodium_1_19_3_different_map
if "%sodeum%"=="enable" (
    set icheerone=--ichorExternalFiles Sodium_v%verifthe%.jar;Iris_v%verifthe%.jar;Indium_v%verifthe%.jar
    set sodone=modern-0.1.0-SNAPSHOT-all.jar;common-0.1.0-SNAPSHOT-all.jar
    set sodtwo=genesis-0.1.0-SNAPSHOT-all.jar;fabric-0.1.0-SNAPSHOT-all.jar;fabric-0.1.0-SNAPSHOT-v%verifthe%.jar
    set ifsodtree=;sodium-0.1.0-SNAPSHOT-all.jar
    set "special="
) else (
    set icheerone=
    set sodone=modern-0.1.0-SNAPSHOT-all.jar
    set sodtwo=genesis-0.1.0-SNAPSHOT-all.jar
    set special=;common-0.1.0-SNAPSHOT-all.jar
    set ifsodtree=;common-0.1.0-SNAPSHOT-all.jar
)

for /D %%I in ("%pather%\files\jre\1.7-1.19\zulu*") do start "Monar Debug" %%~I\bin\java%debugi%.exe --add-modules jdk.naming.dns --add-exports jdk.naming.dns/com.sun.jndi.dns=java.naming -Djna.boot.library.path=%reDevil% -Dlog4j2.formatMsgNoLookups=true --add-opens java.base/java.io=ALL-UNNAMED %Args% -Djava.library.path=%reDevil% -XX:+DisableAttachMechanism -cp %sodone%;%sodtwo%;lunar-lang.jar;lunar-emote.jar;lunar.jar%special% com.moonsworth.lunar.genesis.Genesis --version %mcvrs% --accessToken 0 --assetIndex %indextt% --userProperties {} --gameDir %cuzminecraft% --texturesDir %cumentic% --ichorClassPath %sodone%;%sodtwo%;lunar-lang.jar;lunar-emote.jar;lunar.jar%ifsodtree% %icheerone% --workingDirectory . --classpathDir . --width 854 --height 480 %servjoin%
cls
goto messagefor


:1.19.4
cls
set verifthe=1_19_4
set mcvrs=1.19.4
set indextt=1.19
title Monar Launcher V%vrs% / %mcvrs%
echo                        ______________________
echo                       ┃  Creating Process... ┃
echo                        ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
ping localhost -n 3.5 >nul
goto SettingsLoadTWO

:load10
cd %scd%\offline\multiver
for /D %%I in ("%pather%\files\jre\1.7-1.19\zulu*") do start "Monar Debug" %%~I\bin\java%debugi%.exe --add-modules jdk.naming.dns --add-exports jdk.naming.dns/com.sun.jndi.dns=java.naming -Djna.boot.library.path=%reDevil% -Dlog4j2.formatMsgNoLookups=true --add-opens java.base/java.io=ALL-UNNAMED %Args% -Djava.library.path=%reDevil% -XX:+DisableAttachMechanism -cp modern-0.1.0-SNAPSHOT-all.jar;genesis-0.1.0-SNAPSHOT-all.jar;lunar-lang.jar;lunar-emote.jar;lunar.jar;common-0.1.0-SNAPSHOT-all.jar com.moonsworth.lunar.genesis.Genesis --version %mcvrs% --accessToken 0 --assetIndex %indextt% --userProperties {} --gameDir %cuzminecraft% --texturesDir %cumentic% --ichorClassPath modern-0.1.0-SNAPSHOT-all.jar;genesis-0.1.0-SNAPSHOT-all.jar;lunar-lang.jar;lunar-emote.jar;lunar.jar;common-0.1.0-SNAPSHOT-all.jar %icheerone% --workingDirectory . --classpathDir . --width 854 --height 480 %servjoin%
cls
goto messagefor


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
echo.
echo Checking Lunar Folder....
ping localhost -n 1.5 >nul
for /f "delims=" %%g in (%APPDATA%\.monar\lunarlocation.txt) do set cuzlunar=%%g
for /f "delims=" %%x in (%APPDATA%\.monar\path.txt) do set pather=%%x

if exist "%cuzlunar%" (
echo [+] Lunar Folder Working.
ping localhost -n 1.5 >nul
) else (
echo [-] Your Lunar Folder was not Found...
echo [!] Please report error at discord or change your lunarpath.
ping localhost -n 30.8 >nul
exit
)


echo.
echo Checking Path...

IF EXIST "%pather%" (
    echo Your Path is: "%pather%"
    echo And in Theory is Working!
) ELSE (
    echo Path Not Found Please Report at discord.
    echo Or Change Your Path In Settings. (Option 9)
    ping localhost -n 10.5 >nul
)

echo.
echo Checking Lunar Version's...
IF EXIST "files\lunarpath.txt" (
    for /f "delims=" %%c in (files\lunarpath.txt) do set scd=%%c
) ELSE (
    set scd=%userprofile%\.lunarclient
)

ping localhost -n 3.5 >nul
cd %scd%\offline\multiver

::1.7.10 Troubleshot
if exist v1_7-0.1.0-SNAPSHOT-all.jar (
echo [+] 1.7.10 Its Installed
) else (
echo [-] 1.7.10 Its Not Installed
)

ping localhost -n 1.5 >nul

::1.8.9 Troubleshot
if exist Forge_v1_8.jar (
echo [+] 1.8.9 Skyblock Its Installed
) else (
echo [-] 1.8.9 Skyblock Its Not Installed
)

if exist v1_8-0.1.0-SNAPSHOT-all.jar (
echo [+] 1.8.9  Its Installed
) else (
echo [-] 1.8.9  Its Not Installed
)

ping localhost -n 1.5 >nul

::1.12.2 Troubleshot
if exist v1_12-0.1.0-SNAPSHOT-all.jar (
echo [+] 1.12.2 Its Installed
) else (
echo [-] 1.12.2 Its Not Installed
)

ping localhost -n 1.5 >nul

::1.16.5 Troubleshot
if exist fabric-0.1.0-SNAPSHOT-v1_16_5.jar (
echo [+] 1.16.5 Sodium Its Installed
)

if exist OptiFine_v1_16_5.jar (
echo [+] 1.16.5 Its Installed
) else (
echo [-] 1.16.5 Its Not Installed
)

ping localhost -n 1.5 >nul

::1.17.1 Troubleshot
if exist fabric-0.1.0-SNAPSHOT-v1_17_1.jar (
echo [+] 1.17.1 Sodium Its Installed
)

if exist OptiFine_v1_17_1.jar (
echo [+] 1.17.1 Its Installed
) else (
echo [-] 1.17.1 Its Not Installed
)

ping localhost -n 1.5 >nul

::1.18.1 Troubleshot
if exist OptiFine_v1_18_1.jar (
echo [+] 1.18.1 Its Installed
) else (
echo [-] 1.18.1 Its Not Installed
)

ping localhost -n 1.5 >nul

::1.18.2 Troubleshot
if exist fabric-0.1.0-SNAPSHOT-v1_18_2.jar (
echo [+] 1.18.2 Sodium Its Installed
)

if exist OptiFine_v1_18_2.jar (
echo [+] 1.18.2 Its Installed
) else (
echo [-] 1.18.2 Its Not Installed
)

ping localhost -n 1.5 >nul

::1.19 Troubleshot
if exist OptiFine_v1_19_0.jar (
echo [+] 1.19 Its Installed
) else (
echo [-] 1.19 Its Not Installed
)

ping localhost -n 1.5 >nul

::1.19.2 Troubleshot
if exist OptiFine_v1_19_2.jar (
echo [+] 1.19.2 Its Installed
) else (
echo [-] 1.19.2 Its Not Installed
)

if exist fabric-0.1.0-SNAPSHOT-v1_19_2.jar (
echo [+] 1.19.2 Sodium Its Installed
)

ping localhost -n 1.5 >nul
::1.19.3 Troubleshot
if exist fabric-0.1.0-SNAPSHOT-v1_19_3.jar (
echo [+] 1.19.3 Sodium Its Installed
)

ping localhost -n 1.5 >nul

cd %pather%
echo.
echo Checking Jre and Natives...
if exist "files\jre\1.7-1.19\zulu17.34.19-ca-jre17.0.3-win_x64\bin\javaw.exe" (
echo [+] JRE Exist
) else (
echo [!] JRE Dont Exist, Please Reinstall Monar Or Check Your Path...
) 

ping localhost -n 1.5 >nul

if exist "files\natives\1.7-1.12\OpenAL64.dll" (
echo [+] 1.7 to 1.12 Natives Are Working!
) else (
echo [!] 1.7 to 1.12 Natives Dont Exist, Please Reinstall Monar Or Check Your Path...
) 

if exist "files\natives\1.16-1.19\MumbleLink.dll" (
echo [+] 1.16 to 1.19 Natives Are Working!
) else (
echo [!] 1.16 to 1.19 Natives Dont Exist, Please Reinstall Monar Or Check Your Path...
) 
title Monar Launcher V%vrs% / TroubleShoot Finished!
echo.
PAUSE
cls
goto gui


:jvagentmenui
title Monar Launcher V%vrs% / Addons / Agents
for /f "delims=" %%f in (%appdata%\.monar\agents\name_data\agent_1_data.txt) do set agentname1=%%f
for /f "delims=" %%f in (%appdata%\.monar\agents\name_data\agent_2_data.txt) do set agentname2=%%f
for /f "delims=" %%f in (%appdata%\.monar\agents\name_data\agent_3_data.txt) do set agentname3=%%f
for /f "delims=" %%f in (%appdata%\.monar\agents\name_data\agent_4_data.txt) do set agentname4=%%f
for /f "delims=" %%f in (%appdata%\.monar\agents\name_data\agent_5_data.txt) do set agentname5=%%f
cls
echo.
echo		    ███╗   ███╗ █████╗ ███╗  ██╗ █████╗ ██████╗ 
echo		    ████╗ ████║██╔══██╗████╗ ██║██╔══██╗██╔══██╗
echo		    ██╔████╔██║██║  ██║██╔██╗██║███████║██████╔╝
echo		    ██║╚██╔╝██║██║  ██║██║╚████║██╔══██║██╔══██╗
echo		    ██║ ╚═╝ ██║╚█████╔╝██║ ╚███║██║  ██║██║  ██║
echo	       	    ╚═╝     ╚═╝ ╚════╝ ╚═╝  ╚══╝╚═╝  ╚═╝╚═╝  ╚═╝
echo.
echo                   This Is For The 500 Downloads
echo                      Thanks To Everyone!
echo.
echo			      1) %agentname1%
echo			      2) %agentname2%
echo			      3) %agentname3%
echo			      4) %agentname4%
echo			      5) %agentname5%
echo			      0) Back
echo                       01) Logout/Login Lunar Client
echo                       00) Reset Default
echo.
set /p ajint=Option:

if "%ajint%"=="1" set "agentnumber=1" && goto ajintnam
if "%ajint%"=="2" set "agentnumber=2" && goto ajintnam
if "%ajint%"=="3" set "agentnumber=3" && goto ajintnam
if "%ajint%"=="4" set "agentnumber=4" && goto ajintnam
if "%ajint%"=="5" set "agentnumber=5" && goto ajintnam
if "%ajint%"=="01" goto untillogoin
if "%ajint%"=="0" goto addonz
if "%ajint%"=="00" goto rosetonink

echo Please enter a valid option & timeout /t 1 >nul & goto jvagentmenui
goto jvagentmenui


:untillogoin
cls
echo.
echo		    ███╗   ███╗ █████╗ ███╗  ██╗ █████╗ ██████╗ 
echo		    ████╗ ████║██╔══██╗████╗ ██║██╔══██╗██╔══██╗
echo		    ██╔████╔██║██║  ██║██╔██╗██║███████║██████╔╝
echo		    ██║╚██╔╝██║██║  ██║██║╚████║██╔══██║██╔══██╗
echo		    ██║ ╚═╝ ██║╚█████╔╝██║ ╚███║██║  ██║██║  ██║
echo	       	    ╚═╝     ╚═╝ ╚════╝ ╚═╝  ╚══╝╚═╝  ╚═╝╚═╝  ╚═╝
echo.
echo           [!] HEY! Please Read the Info Before Do AnyThing.
echo.
echo                   1) Login
echo                   2) Logout
echo                   3) INFO (IMPORTANT)
echo                   0) Back
set /p fda=Option:
if "%fda%"=="1" goto changeaccountsfilename
if "%fda%"=="2" goto changeaccountsfilenameforlogout
if "%fda%"=="3" goto epicinfofornubs
if "%fda%"=="0" goto jvagentmenui


:epicinfofornubs
cls
echo                 [!]       READ       [!]
echo this is made only for the CrackedAccount agent
echo this just change the name of the file that contains
echo your account inside, it only change the name of the
echo file, it doesnt touch your account.
PAUSE
goto untillogoin

:changeaccountsfilename
for /f "delims=" %%g in (%APPDATA%\.monar\lunarlocation.txt) do set cuzlunar=%%g
cd %cuzlunar%\settings\game
if exist "accounts_org.json" (
    cls
    del accounts.json
    ren accounts_org.json accounts.json
    echo accounts_org.json has been renamed to accounts.json!
    echo You Are Logged In!
    ping localhost -n 3.5 >nul
    cls
    goto untillogoin
) else (
    cls
    echo You Are Not Logged Out!
    ping localhost -n 4.5 >nul
    goto untillogoin
)

:changeaccountsfilenameforlogout
for /f "delims=" %%g in (%APPDATA%\.monar\lunarlocation.txt) do set cuzlunar=%%g
cd %cuzlunar%\settings\game
if exist "accounts.json" (
    ren accounts.json accounts_org.json
    echo accounts.json has been renamed to accounts_org.json!
    echo You Are Logged Out!
    ping localhost -n 3.5 >nul
    cls
    goto untillogoin
) else (
    cls
    echo You Are Not Logged In!
    ping localhost -n 4.5 >nul
    goto untillogoin
)




:rosetonink
cls
echo [!] Reseting Java Agents...
del /q %appdata%\.monar\agents\option_data
del /q %appdata%\.monar\agents\name_data
del /q %appdata%\.monar\agents\command_data
del /q %appdata%\.monar\agents\switch_data
del /q %appdata%\.monar\agents
rmdir %appdata%\.monar\agents\option_data
rmdir %appdata%\.monar\agents\name_data
rmdir %appdata%\.monar\agents\command_data
rmdir %appdata%\.monar\agents\switch_data
rmdir %appdata%\.monar\agents
ping localhost -n 3.5 >nul
echo [!] Creating Agents SubFolders...
mkdir %APPDATA%\".monar\agents"
mkdir %APPDATA%\".monar\agents\option_data"
mkdir %APPDATA%\".monar\agents\switch_data"
>%appdata%\.monar\agents\switch_data\agent_1_data.txt echo NoData
>%appdata%\.monar\agents\switch_data\agent_2_data.txt echo NoData
>%appdata%\.monar\agents\switch_data\agent_3_data.txt echo NoData
>%appdata%\.monar\agents\switch_data\agent_4_data.txt echo NoData
>%appdata%\.monar\agents\switch_data\agent_5_data.txt echo NoData
break>"%appdata%\.monar\agents\option_data\agent_1_data.txt
break>"%appdata%\.monar\agents\option_data\agent_2_data.txt
break>"%appdata%\.monar\agents\option_data\agent_3_data.txt
break>"%appdata%\.monar\agents\option_data\agent_4_data.txt
break>"%appdata%\.monar\agents\option_data\agent_5_data.txt
mkdir %APPDATA%\".monar\agents\name_data"
>%appdata%\.monar\agents\name_data\agent_1_data.txt echo Agent Slot 1
>%appdata%\.monar\agents\name_data\agent_2_data.txt echo Agent Slot 2
>%appdata%\.monar\agents\name_data\agent_3_data.txt echo Agent Slot 3
>%appdata%\.monar\agents\name_data\agent_4_data.txt echo Agent Slot 4
>%appdata%\.monar\agents\name_data\agent_5_data.txt echo Agent Slot 5
mkdir %APPDATA%\".monar\agents\command_data"
echo SubFolders Created!
ping localhost -n 3.5 >nul
goto jvagentmenui



:ajintnam
for /f "delims=" %%x in (%APPDATA%\.monar\path.txt) do set pather=%%x

if exist "%appdata%\.monar\agents\command_data\agent_%agentnumber%_data.txt" (
    goto gia
) else (
    goto createagentoption
)

:createagentoption
cls
echo.
echo		    ███╗   ███╗ █████╗ ███╗  ██╗ █████╗ ██████╗ 
echo		    ████╗ ████║██╔══██╗████╗ ██║██╔══██╗██╔══██╗
echo		    ██╔████╔██║██║  ██║██╔██╗██║███████║██████╔╝
echo		    ██║╚██╔╝██║██║  ██║██║╚████║██╔══██║██╔══██╗
echo		    ██║ ╚═╝ ██║╚█████╔╝██║ ╚███║██║  ██║██║  ██║
echo	       	    ╚═╝     ╚═╝ ╚════╝ ╚═╝  ╚══╝╚═╝  ╚═╝╚═╝  ╚═╝
echo.
echo             [!] No Data Found On Agent %agentnumber% 
echo             [?] Want To Create A New Data? use yes/no or y/n
set /p dtcreate=Option:

if "%dtcreate%"=="yes" (
    goto createagent
) else (
    set notimportant=aaaa
)

if "%dtcreate%"=="y" (
    goto createagent
) else (
    echo Going back to Menu...
    ping localhost -n 3.5 >nul
    goto jvagentmenui
)

:createagent 
cls
echo.
echo		    ███╗   ███╗ █████╗ ███╗  ██╗ █████╗ ██████╗ 
echo		    ████╗ ████║██╔══██╗████╗ ██║██╔══██╗██╔══██╗
echo		    ██╔████╔██║██║  ██║██╔██╗██║███████║██████╔╝
echo		    ██║╚██╔╝██║██║  ██║██║╚████║██╔══██║██╔══██╗
echo		    ██║ ╚═╝ ██║╚█████╔╝██║ ╚███║██║  ██║██║  ██║
echo	       	    ╚═╝     ╚═╝ ╚════╝ ╚═╝  ╚══╝╚═╝  ╚═╝╚═╝  ╚═╝
echo.
echo              [?]  Type Name of you agent. (include the .jar 
echo                                             if it has it)
set /p namonebr=Name:
echo              [!] type "none" if dont use it
set /p gaimkao=Argument:
if "%gaimkao%"=="none" (
    break>"%appdata%\.monar\agents\option_data\agent_%agentnumber%_data.txt"
    >%appdata%\.monar\agents\option_data\agent_%agentnumber%_data_disabled.txt echo Disabled
) else (
    >%appdata%\.monar\agents\option_data\agent_%agentnumber%_data.txt echo =%gaimkao% 
)
>%appdata%\.monar\agents\command_data\agent_%agentnumber%_data.txt echo -javaagent:%pather%\files\agents\%namonebr%
>%appdata%\.monar\agents\name_data\agent_%agentnumber%_data.txt echo %namonebr%
>%appdata%\.monar\agents\switch_data\agent_%agentnumber%_data.txt echo enable
echo Saved!
ping localhost -n 3.5 >nul
goto gia

:gia
for /f "delims=" %%k in (%appdata%\.monar\agents\name_data\agent_%agentnumber%_data.txt) do set cuzagentname=%%k
for /f "delims=" %%k in (%appdata%\.monar\agents\switch_data\agent_%agentnumber%_data.txt) do set cuzagentswitch=%%k
if exist "%appdata%\.monar\agents\option_data\agent_%agentnumber%_data_disabled.txt" (
    for /f "delims=" %%k in (%appdata%\.monar\agents\option_data\agent_%agentnumber%_data_disabled.txt) do set cuzagentoption=%%k
) else (
    for /f "delims=" %%k in (%appdata%\.monar\agents\option_data\agent_%agentnumber%_data.txt) do set cuzagentoption=%%k
)
cls
echo.
echo		    ███╗   ███╗ █████╗ ███╗  ██╗ █████╗ ██████╗ 
echo		    ████╗ ████║██╔══██╗████╗ ██║██╔══██╗██╔══██╗
echo		    ██╔████╔██║██║  ██║██╔██╗██║███████║██████╔╝
echo		    ██║╚██╔╝██║██║  ██║██║╚████║██╔══██║██╔══██╗
echo		    ██║ ╚═╝ ██║╚█████╔╝██║ ╚███║██║  ██║██║  ██║
echo	       	    ╚═╝     ╚═╝ ╚════╝ ╚═╝  ╚══╝╚═╝  ╚═╝╚═╝  ╚═╝
echo.
if "%cuzagentswitch%"=="enable" (
    echo                  [/] Agent %agentnumber% Status: Enabled
) else (
    echo                  [/] Agent %agentnumber% Status: Disabled
)
echo.
echo                   1) Name: %cuzagentname%
echo                   2) Argument: %cuzagentoption%
echo                   3) Enable/Disable Agent
echo                   4) Reset
echo                   0) Back
set /p dasdas=Option:
if "%dasdas%"=="0" goto jvagentmenui
if "%dasdas%"=="1" goto writenameagent
if "%dasdas%"=="2" goto writeoptionagent
if "%dasdas%"=="3" goto switchagent
if "%dasdas%"=="4" goto resetdefsaint

echo Please enter a valid option & timeout /t 1 >nul & goto gia
goto gia


:switchagent
cls
if "%cuzagentswitch%"=="enable" (
    echo Agent Disabled
    del %appdata%\.monar\agents\switch_data\agent_%agentnumber%_data.txt
    >%appdata%\.monar\agents\switch_data\agent_%agentnumber%_data.txt echo disable
) else (
    echo Agent Enabled
    del %appdata%\.monar\agents\switch_data\agent_%agentnumber%_data.txt
    >%appdata%\.monar\agents\switch_data\agent_%agentnumber%_data.txt echo enable
)
echo Saved!
ping localhost -n 3.5 >nul
goto gia

:writenameagent
echo.
set /p namonebr=Name:
del %appdata%\.monar\agents\name_data\agent_%agentnumber%_data.txt
>%appdata%\.monar\agents\name_data\agent_%agentnumber%_data.txt echo %namonebr%
echo Saved!
ping localhost -n 3.5 >nul
goto gia

:writeoptionagent
echo              [!] type "none" if it dont use it
echo.
set /p gaimkao=Argument:
del %appdata%\.monar\agents\option_data\agent_%agentnumber%_data.txt
if "%gaimkao%"=="none" (
    break>"%appdata%\.monar\agents\option_data\agent_%agentnumber%_data.txt"
    >%appdata%\.monar\agents\option_data\agent_%agentnumber%_data_disabled.txt echo Disabled
) else (
    if exist "%appdata%\.monar\agents\option_data\agent_%agentnumber%_data_disabled.txt" ( del %appdata%\.monar\agents\option_data\agent_%agentnumber%_data_disabled.txt )
    >%appdata%\.monar\agents\option_data\agent_%agentnumber%_data.txt echo =%gaimkao% 
)
echo Saved!
ping localhost -n 3.5 >nul
goto gia




:resetdefsaint
del %appdata%\.monar\agents\option_data\agent_%agentnumber%_data.txt
del %appdata%\.monar\agents\command_data\agent_%agentnumber%_data.txt
del %appdata%\.monar\agents\name_data\agent_%agentnumber%_data.txt
>%appdata%\.monar\agents\name_data\agent_%agentnumber%_data.txt echo Agent Slot %agentnumber%
del %appdata%\.monar\agents\switch_data\agent_%agentnumber%_data.txt
>%appdata%\.monar\agents\switch_data\agent_%agentnumber%_data.txt echo NoData
if exist "%appdata%\.monar\agents\option_data\agent_%agentnumber%_data_disabled.txt" (
    del %appdata%\.monar\agents\option_data\agent_%agentnumber%_data_disabled.txt
)
cls
echo [!] Agent %agentnumber% Has Been Reseted!
ping localhost -n 3.5 >nul
goto jvagentmenui


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
set "ineedtodonine=                      9) Change Path"
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
echo			      6) Custom .lunarclient
echo                       7) Custom .minecraft
echo                       8) Cosmetics (Disables From Load Cosmetics)
echo %ineedtodonine%
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
if "%verop%"=="6" goto customlunar
if "%verop%"=="7" goto customminecraft
if "%verop%"=="8" goto cosmic
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
echo                     [?] Change Your Path?
echo                  [!] Please Specify Your Path.
set /p unsigfull=Path: 
>%APPDATA%\.monar\path.txt echo %unsigfull%
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
echo                 [?] Enter Where is Your .minecraft?
set /p mcloc=Location: 
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
echo                 [?] Enter Where is Your .lunarclient?
set /p lcloc=Location: 
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
echo                 [?] Load Cosmetics?
echo                 [!] this disable/enable from loading.
echo                      (enable/disable)
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
echo                      (enable/disable)
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
echo                      (enable/disable)
set /p askthree=Option:
if "%askthree%"=="enable" goto askthreeena
if "%askthree%"=="disable" goto askthreedis

echo Please enter a valid option & timeout /t 1 >nul & goto lunaRRxforGee
goto lunaRRxforGee


:askthreeena
del %APPDATA%\.monar\lunarxforge.txt
>%APPDATA%\.monar\lunarxforge.txt echo enable
echo Settings SAVED!
ping localhost -n 4.5 >nul
goto setupinn

:askthreedis
del %APPDATA%\.monar\lunarxforge.txt
>%APPDATA%\.monar\lunarxforge.txt echo disable
echo Settings SAVED!
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
echo                   [?] Use Debug?
echo                   (enable/disable)
set /p askone=Option:
if "%askone%"=="enable" goto askoneena
if "%askone%"=="disable" goto askonedis
if "%askone%"=="enable" goto askoneena

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
echo           [?] How many ram do you want to allocate?
echo                 [!] Use Normal Numbers like "4"
set /p raameE=Ram: 
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
echo             [?] Join Server While launch? Enter The Ip.
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
echo             [?] Proxy Ip?
set /p ipin=Ip:
del %APPDATA%\.monar\lcproxupdate_hosturl.txt
del %APPDATA%\.monar\lcproxupdate_ip.txt
>%APPDATA%\.monar\lcproxupdate_hosturl.txt echo %lccproxupdater%
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
