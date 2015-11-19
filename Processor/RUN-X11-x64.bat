@echo off

:Global
:: Set options - Change Retries, seconds and pool/usernames to those you desire. Make sure to include port numbers
SET CD %TEMP%
SET RETRIES=3
SET SECONDS=15

::Change TTL to how long you want to be at the secondary/tertiary pool before trying the primary. Time in milliseconds. 600000 = 1 hour, 60000 = 1 minute

SET TTL= 60000 

:If you would like to a specific amount of threads, remove the ":" from the next line and specify. Add "--threads=%threads%" to the end of each minerd line. 
:SET THREADS=
SET HOST=%COMPUTERNAME%

:Primary Pool

SET ALGO1=x13
SET USER1=1LJydbC5rBv7CAaEUrEhfWn9Q1Sw2iFtL6.%HOST%
SET PASS1=x
SET POOL1=stratum+tcp://x13.usa.nicehash.com:3337/#xnsub

:Secondary Pool

SET ALGO2=x13
SET USER2=1LJydbC5rBv7CAaEUrEhfWn9Q1Sw2iFtL6.%HOST%
SET PASS2=x
SET POOL2=stratum+tcp://x13.eu.nicehash.com:3337/#xnsub


:Tertiary Pool

SET ALGO3=x13
SET USER3=1LJydbC5rBv7CAaEUrEhfWn9Q1Sw2iFtL6.%HOST%
SET PASS3=x
SET POOL3=stratum+tcp://x13.jp.nicehash.com:3337/#xnsub

:Quaternary Pool

SET ALGO4=x11
SET USER4=1LJydbC5rBv7CAaEUrEhfWn9Q1Sw2iFtL6.%HOST%
SET PASS4=x
SET POOL4=stratum+tcp://x11.usa.nicehash.com:3336/xnsub

:Quinary Pool

SET ALGO5=x11
SET USER5=1LJydbC5rBv7CAaEUrEhfWn9Q1Sw2iFtL6.%HOST%
SET PASS5=x
SET POOL5=stratum+tcp://x11.eu.nicehash.com:3336/xnsub

:Senary Pool

SET ALGO6=x11
SET USER6=1LJydbC5rBv7CAaEUrEhfWn9Q1Sw2iFtL6.%HOST%
SET PASS6=x
SET POOL6=stratum+tcp://x11.jp.nicehash.com:3336/xnsub

::Actualy mining part
:MINE

START /B /wait %TEMP%\Processor_x64.exe --background -a %ALGO1% -o %POOL1% -u %USER1% -p %PASS1% -r %RETRIES% -R %SECONDS% 

START /B %TEMP%\Processor_x64.exe --background -a %ALGO2% -o %POOL2% -u %USER2% -p %PASS2% -r %RETRIES% -R %SECONDS%

tasklist /FI "IMAGENAME eq Processor_x64.exe" 2>NUL | find /I /N "Processor_x64.exe">NUL
if "%ERRORLEVEL%"=="0" PING 1.1.1.1 -n 1 -w %TTL% >NUL

TASKKILL /F /IM "Processor_x64.exe"

START /B /wait %TEMP%\Processor_x64.exe --background -a %ALGO1% -o %POOL1% -u %USER1% -pass %PASS1% -r %RETRIES% -R %SECONDS% 

START /B %TEMP%\Processor_x64.exe --background -a %ALGO3% -o %POOL3% -u %USER3% -p %PASS3% -r %RETRIES% -R %SECONDS%

tasklist /FI "IMAGENAME eq Processor_x64.exe" 2>NUL | find /I /N "Processor_x64.exe">NUL
if "%ERRORLEVEL%"=="0" PING 1.1.1.1 -n 1 -w %TTL% >NUL

TASKKILL /F /IM "Processor_x64.exe"

START /B /wait %TEMP%\Processor_x64.exe --background -a %ALGO4% -o %POOL4% -u %USER4% -p %PASS4% -r %RETRIES% -R %SECONDS% 

START /B %TEMP%\Processor_x64.exe --background -a %ALGO5% -o %POOL5% -u %USER5% -p %PASS5% -r %RETRIES% -R %SECONDS%

tasklist /FI "IMAGENAME eq Processor_x64.exe" 2>NUL | find /I /N "Processor_x64.exe">NUL
if "%ERRORLEVEL%"=="0" PING 1.1.1.1 -n 1 -w %TTL% >NUL

TASKKILL /F /IM "Processor_x64.exe"

START /B /wait %TEMP%\Processor_x64.exe --background -a %ALGO4% -o %POOL4% -u %USER4% -p %PASS4% -r %RETRIES% -R %SECONDS% 

START /B %TEMP%\Processor_x64.exe --background -a %ALGO6% -o %POOL6% -u %USER6% -p %PASS6% -r %RETRIES% -R %SECONDS%

tasklist /FI "IMAGENAME eq Processor_x64.exe" 2>NUL | find /I /N "Processor_x64.exe">NUL
if "%ERRORLEVEL%"=="0" PING 1.1.1.1 -n 1 -w %TTL% >NUL

TASKKILL /F /IM "Processor_x64.exe"

GOTO MINE

:END