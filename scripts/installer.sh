#!/bin/bash
# 安装路径
APP_DIR="/Applications/ImageToExcel"
# 创建应用目录
sudo mkdir -p $APP_DIR
# 复制主程序
sudo cp -R /tmp/IMAGE-TO-EXCEL/* $APP_DIR
# 配置launchd服务
sudo tee /Library/LaunchDaemons/com.imagetexcel.backend.plist <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Label</key>
    <string>com.imagetexcel.backend</string>
    <key>ProgramArguments</key>
    <array>
        <string>$APP_DIR/start_services.sh</string>
    </array>
    <key>RunAtLoad</key>
    <true/>
</dict>
</plist>
EOF
# 设置权限
sudo chown root:wheel /Library/LaunchDaemons/com.imagetexcel.backend.plist
# 启动服务
sudo launchctl load /Library/LaunchDaemons/com.imagetexcel.backend.plist
# 运行安装后测试
$APP_DIR/run_tests.js
