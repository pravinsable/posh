function compile
echo "%cd%\%solution%"
rem for /F  %%v in ('dir /S  /b *.csproj') do sed -i -e "s#HintPath>\(.*\)\\#HintPath>$(PRIMORDIAL_ALL_DLLS)\\Current\\$(Configuration)\\#g" %%v
echo Compiling %solution%
FOR /F "tokens=* USEBACKQ" %%F IN (` devenv.com  %solution% /rebuild ^| findstr failed`) DO ( SET result=%%F)
set result=%result:Please see the Output Window for details.=%
set success= succeeded, 0 failed,
if "x!result:%success%=!"=="x%result%" (
  echo [95m%result%[0m
) else (
  echo [92m%result%[0m
)
goto:eo
