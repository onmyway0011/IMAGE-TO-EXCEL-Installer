#!/bin/bash
# 创建临时构建目录
BUILD_DIR="/tmp/IMAGE-TO-EXCEL"
mkdir -p $BUILD_DIR
# 复制项目文件
cp -R ../client $BUILD_DIR
cp -R ../src $BUILD_DIR
cp package.json $BUILD_DIR
cp run_tests.js $BUILD_DIR
# 创建安装包
pkgbuild \
    --root $BUILD_DIR \
    --scripts scripts \
    --install-location /tmp/IMAGE-TO-EXCEL \
    --identifier com.imagetexcel.pkg \
    --version 1.0 \
    ImageToExcel.pkg
# 创建带图标的DMG文件
create-dmg \
  --volname "ImageToExcel Installer" \
  --background "background.png" \
  --window-pos 200 120 \
  --window-size 800 400 \
  --icon-size 100 \
  --icon "ImageToExcel.app" 200 190 \
  --app-drop-link 600 190 \
  ImageToExcel.dmg \
  ImageToExcel.pkg
