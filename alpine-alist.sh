#!/bin/sh

# 1. 安装 wget 和 supervisor
apk add wget supervisor

# 2. 下载 alist 压缩包
wget https://github.com/alist-org/alist/releases/download/v3.24.0/alist-linux-musl-amd64.tar.gz

# 3. 解压缩 alist 压缩包
tar -zxvf alist-linux-musl-amd64.tar.gz

# 4. 删除压缩包
rm alist-linux-musl-amd64.tar.gz

# 5. 给予 alist 可执行权限
chmod +x alist

# 6. 将 supervisord 添加到开机启动
rc-update add supervisord boot

# 7. 重启 supervisord 服务
service supervisord restart

# 8. 生成 supervisord 默认配置文件
echo_supervisord_conf > /etc/supervisord.conf

# 9. 添加 include 指令到 supervisord.conf 文件
echo -e "\n[include]\nfiles = /etc/supervisord_conf/*.ini" >> /etc/supervisord.conf

# 10. 创建 supervisord 配置文件夹
mkdir -p /etc/supervisord_conf/

# 11. 创建 alist 的 supervisord 配置文件
echo -e "[program:alist]\ndirectory=/root/\ncommand=/root/alist server\nautostart=true\nautorestart=true\n;stderr_logfile=/tmp/alist.err\n;stdout_logfile=/tmp/alist.log\nenvironment=CODENATION_ENV=prod" > /etc/supervisord_conf/alist.ini

# 12. 启动 supervisord 并指定配置文件
supervisord -c /etc/supervisord.conf

# 14. 使用 supervisorctl 启动 alist
supervisorctl start alist
# 15. 获取 alist 密码
./alist admin