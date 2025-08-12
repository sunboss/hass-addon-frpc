#!/bin/bash

# 提取配置文件中的参数
SERVER_ADDR=${SERVER_ADDR:-"frps.example.com"}
SERVER_PORT=${SERVER_PORT:-7000}
TOKEN=${TOKEN:-"your-token"}
LOCAL_IP=${LOCAL_IP:-"192.168.1.10"}
LOCAL_PORT=${LOCAL_PORT:-80}
SUBDOMAIN=${SUBDOMAIN:-"homeassistant"}

# 启动 frpc
frpc -c <(echo "
[common]
server_addr = $SERVER_ADDR
server_port = $SERVER_PORT
token = $TOKEN

[$SUBDOMAIN]
type = tcp
local_ip = $LOCAL_IP
local_port = $LOCAL_PORT
remote_port = 6000
")
