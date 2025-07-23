# hass-addon-frpc

在 Home Assistant 中运行 frpc 的 Supervisor 加载项。

## 安装

1. 在 Home Assistant 中打开 **Supervisor → Add-on Store → 右上角菜单 → Repositories**  
   添加 `https://github.com/sunboss/hass-addon-frpc`
2. 找到 **Frpc for Home Assistant** 并安装、启动。
3. 在「配置」页按 JSON 格式填写 `server_addr`、`server_port`、`token` 和 `tunnels`。

## 示例配置

```json
{
  "server_addr": "frp.example.com",
  "server_port": 7000,
  "token": "my_token",
  "tunnels": [
    {
      "name": "hass",
      "type": "http",
      "local_ip": "127.0.0.1",
      "local_port": 8123,
      "subdomain": "ha"
    },
    {
      "name": "ssh",
      "type": "tcp",
      "local_ip": "127.0.0.1",
      "local_port": 22,
      "remote_port": 60022
    }
  ]
}
