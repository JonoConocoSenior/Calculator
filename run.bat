@echo off
REM Navigate to the project directory
cd /d "C:\path\to\your\project"

REM Create a virtual environment
python -m venv venv

REM Activate the virtual environment
call venv\Scripts\activate

REM Install required packages (if any)
REM pip install -r requirements.txt

REM Run the Python application
python Application.py

REM Deactivate the virtual environment
deactivate