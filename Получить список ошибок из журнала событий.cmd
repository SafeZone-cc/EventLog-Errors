@set @x=0; /*
@echo off
SetLocal
Color 1A
echo.
echo EventLog Errors by Dragokas              [  SafeZone.cc  ]
echo.
echo.
echo ����祭�� ���⮢ �訡�� � �।�०����� �� ��ୠ�� ᮡ�⨩.
echo.
echo ��������, �������� ...
echo.

cd /d "%~dp0"
md LOGS 2>NUL
cd "Log Parser 2.2"

LogParser.exe file:ScriptApplication.sql -i:EVT -o:TPL -tpl:Template.html -FileMode 1 -noEmptyFile OFF >NUL
LogParser.exe file:ScriptSystem.sql -i:EVT -o:TPL -tpl:Template.html -FileMode 1 -noEmptyFile OFF >NUL

net session >NUL 2>NUL || (
  echo �������筮 �ࠢ !!!
  echo ����室��� ����᪠�� ��� 䠩� �ࠢ�� ������� ��� "�� ����� �����������".
  echo.
  echo ����訢�� �ਢ������ ...
  cscript.exe //nologo //e:jscript "%~fs0"
  Exit /B
)

copy /y %SystemRoot%\System32\winevt\Logs\Setup.evtx . >NUL
LogParser.exe file:ScriptSetup.sql -i:EVT -o:TPL -tpl:Template.html -FileMode 1 -noEmptyFile OFF >NUL
del /F /A Setup.evtx

echo.
echo ����娢���� ����� �� ����� LOGS � ��娢 �ଠ� ZIP
echo � �뫮��� �� ��㬥, ��� ��� ����뢠�� ������.

ping -n 3 127.1 >NUL
explorer /select,..\Logs

pause >NUL
Exit /B

*/new ActiveXObject('Shell.Application').ShellExecute (WScript.ScriptFullName,'Admin','','runas',1);