@echo off
REM Navigate to the project directory
cd /d "C:\path\to\your\project"

REM Check if Python is installed
python --version
if %errorlevel% neq 0 (
    echo Python is not installed or not found in PATH.
    exit /b 1
)

REM Create a virtual environment
python -m venv venv

REM Activate the virtual environment
call venv\Scripts\activate

REM Install required packages (if any)
REM pip install -r requirements.txt

REM Run the Python application
python Application.py

REM Deactivate the virtual environment (not needed in batch script)
REM deactivate