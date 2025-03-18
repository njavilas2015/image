#!/bin/bash

clients_file="/docker-entrypoint.d/clients.yml"

nginx_config_path="/etc/nginx/conf.d/"

for client in $(yq e '.clients[]' "$clients_file"); do
    _jq() {
        echo ${client} | base64 --decode | yq e "${1}" -
    }

    id=$(_jq '.id')
    subdomain=$(_jq '.subdomain')
    domain=$(_jq '.domain')

    echo "ID: $id, Subdomain: $subdomain, Domain: $domain"
done

#
clients=$(yq e '.clients[].subdomain' "$clients_file")

for client in $clients; do
    cat <<EOF > "${nginx_config_path}${client}.conf"
server {
    listen 80;
    server_name ${client}.boxer.net;

    location / {
        proxy_pass http://${client}:8000;
        proxy_set_header Host \$host;
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto \$scheme;
    }
}
#
#EOF
#done

nginx -s reload
