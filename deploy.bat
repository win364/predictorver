@echo off
echo Deploying Mines Predictor to Vercel...
echo.

REM Check if Vercel CLI is installed
vercel --version >nul 2>&1
if errorlevel 1 (
    echo Vercel CLI not found. Installing...
    npm install -g vercel
    if errorlevel 1 (
        echo Failed to install Vercel CLI. Please install manually: npm install -g vercel
        pause
        exit /b 1
    )
)

REM Login to Vercel if needed
echo Checking Vercel authentication...
vercel whoami >nul 2>&1
if errorlevel 1 (
    echo Please login to Vercel:
    vercel login
)

REM Deploy to Vercel
echo.
echo Deploying predictor...
vercel --prod --name mines-predictor

echo.
echo Deployment complete!
echo Check your Vercel dashboard for the new URL.
echo.
pause
