@set @x=0; /*
@echo off
SetLocal
Color 1A
echo.
echo EventLog Errors by Dragokas              [  SafeZone.cc  ]
echo.
echo.
echo Получение отчетов ошибок и предупреждений из журнала событий.
echo.
echo Пожалуйста, подождите ...
echo.

cd /d "%~dp0"
md LOGS 2>NUL
cd "Log Parser 2.2"

LogParser.exe file:ScriptApplication.sql -i:EVT -o:TPL -tpl:Template.html -FileMode 1 -noEmptyFile OFF >NUL
LogParser.exe file:ScriptSystem.sql -i:EVT -o:TPL -tpl:Template.html -FileMode 1 -noEmptyFile OFF >NUL

net session >NUL 2>NUL || (
  echo Недостаточно прав !!!
  echo Необходимо запускать этот файл правой кнопкой мыши "От имени Администратора".
  echo.
  echo Запрашиваю привилегии ...
  cscript.exe //nologo //e:jscript "%~fs0"
  Exit /B
)

copy /y %SystemRoot%\System32\winevt\Logs\Setup.evtx . >NUL
LogParser.exe file:ScriptSetup.sql -i:EVT -o:TPL -tpl:Template.html -FileMode 1 -noEmptyFile OFF >NUL
del /F /A Setup.evtx

echo.
echo Заархивируйте отчеты из папки LOGS в архив формата ZIP
echo и выложите на форуме, где Вам оказывают помощь.

ping -n 3 127.1 >NUL
explorer /select,..\Logs

pause >NUL
Exit /B

*/new ActiveXObject('Shell.Application').ShellExecute (WScript.ScriptFullName,'Admin','','runas',1);