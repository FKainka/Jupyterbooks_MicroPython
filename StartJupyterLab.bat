@echo off

echo Python Version:
python --version

if errorlevel 1 (
echo Please install Python
pause 
exit)

echo pip Version:
pip --version

if errorlevel 1 (
echo Please install pip
pause 
exit)

echo ---
echo Jupyter-Lab Version:
jupyter-lab --version

if errorlevel 1 (
echo Installing jupyter-lab

pip install jupyterlab
pip install jupyter_micropython_kernel
python -m jupyter_micropython_kernel.install

exit)

echo ---
echo Looking for MicroPython kernel:
jupyter kernelspec list | findstr /C:"micropython" 1>nul

if errorlevel 1 (
echo MicroPython kernel not found. Installing

pip install jupyter_micropython_kernel
python -m jupyter_micropython_kernel.install

) ELSE (
  echo MicroPython kernel found
)

echo Starting Jupyter Lab
jupyter-lab