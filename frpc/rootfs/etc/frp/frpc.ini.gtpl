[common]
server_addr = {{ .server_addr }}
server_port = {{ .server_port }}
token = {{ .token }}

{{ range .tunnels }}
[{{ .name }}]
type = {{ .type }}
local_ip = {{ .local_ip }}
local_port = {{ .local_port }}
remote_port = {{ .remote_port }}
{{ end }}
