@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

echo ========================================
echo           Vue项目启动脚本
echo ========================================

:: 设置脚本标题
title Vue项目启动脚本

:: 获取当前脚本所在目录（script目录）
set "SCRIPT_DIR=%~dp0"

:: 切换到项目根目录（script的父目录）
set "ROOT_DIR=%SCRIPT_DIR%.."
cd /d "%ROOT_DIR%"

echo 当前工作目录：%cd%
echo.

:: 检查package.json是否存在
if not exist "package.json" (
    echo [错误] 未找到package.json文件，请确保在Vue项目根目录中运行此脚本
    echo 按任意键退出...
    pause >nul
    exit /b 1
)

:: 检查node_modules是否存在
if not exist "node_modules" (
    echo [警告] 未找到node_modules目录，正在安装依赖...
    echo.
    call npm install
    if errorlevel 1 (
        echo [错误] 依赖安装失败！
        echo 按任意键退出...
        pause >nul
        exit /b 1
    )
    echo.
)

echo 正在启动Vue开发服务器...
echo ========================================
echo.

:: 运行npm run dev
call npm run dev

:: 如果npm run dev失败，暂停以便查看错误信息
if errorlevel 1 (
    echo.
    echo [错误] Vue开发服务器启动失败！
    echo 错误代码: %errorlevel%
    echo.
    echo 按任意键退出...
    pause >nul
    exit /b %errorlevel%
)

endlocal
    
    