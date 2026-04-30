@echo off
setlocal

echo [1/3] Checking Docker...
where docker >nul 2>nul
if errorlevel 1 (
  echo Docker is not installed or not in PATH.
  echo Please install/start Docker Desktop first, then rerun this script.
  pause
  exit /b 1
)

echo [2/3] Building and starting local site with Docker...
docker compose up --build -d
if errorlevel 1 (
  echo Failed to build/start site. Please check Docker logs.
  pause
  exit /b 1
)

echo [3/3] Opening preview page...
timeout /t 3 /nobreak >nul
start "" "http://localhost:8080"

echo Local preview is running at: http://localhost:8080
echo To stop it later, run: docker compose down
endlocal
