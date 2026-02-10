set "XCFLAGS=/W3 /MT /nologo"

cd pthreads.2

:: Build the VSE-inlined configuration
nmake /E clean VSE-inlined
if %ERRORLEVEL% neq 0 exit 1

:: Build the static configuration
nmake /E clean VC-static
if %ERRORLEVEL% neq 0 exit 1

:: Create the output directories
mkdir %LIBRARY_BIN%
mkdir %LIBRARY_INC%
mkdir %LIBRARY_LIB%

:: Copy the built files
copy pthreadVSE2.lib %LIBRARY_LIB%\pthreads.lib
copy pthreadVSE2.lib %LIBRARY_LIB%\pthread.lib
copy pthreadVSE2.dll %LIBRARY_BIN%\pthreadVSE2.dll

copy pthread.h %LIBRARY_INC%\pthread.h
copy sched.h %LIBRARY_INC%\sched.h
copy semaphore.h %LIBRARY_INC%\semaphore.h

copy pthreadVC2.lib %LIBRARY_LIB%\pthreads_static.lib

cd tests
set "CFLAGS=%XCFLAGS%"
