@echo off
if not "%1" == "" goto :arg1exists
echo usage: base64encode input-file [output-file]
goto :eof
:arg1exists
set base64out=%2
if "%base64out%" == "" set base64out=con 
(
  set base64tmp=base64.tmp
  certutil -encode "%1" %base64tmp% > nul
  findstr /v /c:- %base64tmp%
  erase %base64tmp%
) > %base64out%
