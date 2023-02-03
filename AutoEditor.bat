@echo off
call :filedialog file

set /p margin= margin?:

echo %margin%



pause

auto-editor %file% --margin %margin%sec --export premiere

exit /b


:filedialog :: &file
setlocal 
set dialog="about:<input type=file id=FILE><script>FILE.click();new ActiveXObject
set dialog=%dialog%('Scripting.FileSystemObject').GetStandardStream(1).WriteLine(FILE.value);
set dialog=%dialog%close();resizeTo(0,0);</script>"
for /f "tokens=* delims=" %%p in ('mshta.exe %dialog%') do set "file=%%p"
endlocal  & set %1=%file%