#!/usr/bin/env bashio
set -e

CONFIG_PATH=/data/options.json
FRPC_INI=/etc/frp/frpc.ini

# 生成 frpc.ini
cat > "$FRPC_INI" <<EOF
[common]
server_addr = $(bashio::config 'server_addr')
server_port = $(bashio::config 'server_port')
token = $(bashio::config 'token')
log_level = info
login_fail_exit = false

EOF

# 动态生成 tunnel 段落
bashio::config 'tunnels' | jq -r '.[] | @base64' | while read -r tunnel; do
    _jq() {
        echo "$tunnel" | base64 -d | jq -r "$1"
    }

    name=$(_jq '.name')
    type=$(_jq '.type')
    local_ip=$(_jq '.local_ip')
    local_port=$(_jq '.local_port')
    remote_port=$(_jq '.remote_port')
    subdomain=$(_jq '.subdomain // ""')
    custom_domains=$(_jq '.custom_domains // ""')

    cat >> "$FRPC_INI" <<EOF
[$name]
type = $type
local_ip = $local_ip
local_port = $local_port
remote_port = $remote_port
EOF

    [[ -n "$subdomain" ]] && echo "subdomain = $subdomain" >> "$FRPC_INI"
    [[ -n "$custom_domains" ]] && echo "custom_domains = $custom_domains" >> "$FRPC_INI"

done

exec /usr/bin/frpc -c "$FRPC_INI"
