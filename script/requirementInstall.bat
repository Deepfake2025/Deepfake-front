@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

REM 设置窗口标题
title Vue项目依赖安装脚本

echo ==============================================
echo          Vue项目依赖安装脚本
echo ==============================================
echo.

REM 获取当前脚本目录（script目录）
set "SCRIPT_DIR=%~dp0"

REM 切换到项目根目录（script的父目录）
set "ROOT_DIR=%SCRIPT_DIR%.."
cd /d "%ROOT_DIR%"

echo 当前工作目录：%cd%
echo.

REM 检查当前目录是否有package.json
if not exist "package.json" (
    echo 错误：未在当前目录找到package.json文件
    echo 请确保在项目根目录下运行此脚本
    echo.
    echo 按任意键退出...
    pause > nul
    exit /b 1
)

REM 检查node是否安装
node --version >nul 2>&1
if %errorlevel% equ 0 (
    echo 检测到Node.js已安装:
    node -v
    echo.
) else (
    echo 错误：未找到Node.js，请先安装Node.js
    echo 推荐版本：^20.19.0 或 ^22.12.0
    echo.
    echo 按任意键退出...
    pause > nul
    exit /b 1
)

REM 检查npm是否安装
npm --version >nul 2>&1
if %errorlevel% equ 0 (
    echo 检测到npm已安装:
    npm -v
    echo.
) else (
    echo 错误：未找到npm，请先安装Node.js（包含npm）
    echo.
    echo 按任意键退出...
    pause > nul
    exit /b 1
)

REM 检查并安装项目核心依赖
if exist "node_modules" (
    echo 检测到已存在node_modules目录
    echo 正在检查并更新核心依赖...
    echo.
) else (
    echo 未找到node_modules目录
    echo 正在安装所有核心依赖...
    echo.
)

REM 安装核心依赖
call npm install
if %errorlevel% neq 0 (
    echo.
    echo ==============================================
    echo          核心依赖安装失败！
    echo ==============================================
    echo 请检查网络连接或package.json文件格式
    echo.
    echo 按任意键退出...
    pause > nul
    exit /b 1
)

echo.
echo ==============================================
echo          核心依赖安装成功！
echo ==============================================
echo.

REM 询问是否安装Element Plus按需导入插件
set /p INSTALL_PLUGINS="是否安装Element Plus按需导入插件？(y/n): "
if /i "%INSTALL_PLUGINS%"=="y" (
    echo.
    echo ==============================================
    echo          开始安装Element Plus按需导入插件
    echo ==============================================
    echo.
    
    REM 安装unplugin系列插件（开发环境依赖）
    echo 正在安装 unplugin-vue-components...
    call npm install unplugin-vue-components --save-dev
    
    echo 正在安装 unplugin-auto-import...
    call npm install unplugin-auto-import --save-dev
    
    echo 正在安装 unplugin-element-plus...
    call npm install unplugin-element-plus --save-dev
    
    echo.
    echo ==============================================
    echo          插件安装完成！
    echo ==============================================
) else (
    echo.
    echo 已跳过插件安装
)

echo.
echo ==============================================
echo          依赖安装完成！
echo ==============================================
echo.
echo 可以使用以下命令启动项目：
echo   npm run dev   - 启动开发服务器
echo   npm run build - 构建生产版本
echo   npm run preview - 预览构建结果
echo.
echo 按任意键退出...
pause > nul