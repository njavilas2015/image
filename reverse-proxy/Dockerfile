FROM nginx:alpine

RUN apk add --no-cache bash curl jq yq

COPY ./entrypoint.sh /docker-entrypoint.d/entrypoint.sh
COPY ./generate_nginx_configs.sh /docker-entrypoint.d/generate_nginx_configs.sh

RUN chmod +x /docker-entrypoint.d/entrypoint.sh
RUN chmod +x /docker-entrypoint.d/generate_nginx_configs.sh

ENTRYPOINT ["/entrypoint.sh"]

EXPOSE 80 443