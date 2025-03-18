HELLOWORD_GO=njavilas/helloword:go
HELLOWORD_GO_PATH=helloword_go

HELLOWORD_NGINX=njavilas/helloword:nginx
HELLOWORD_NGINX_PATH=helloword_nginx

PROXY_NGINX=njavilas/proxy:nginx
PROXY_NGINX_PATH=proxy_nginx


define docker_build
	cd $(1) && docker build -t $(2) -f Dockerfile .
	docker push $(2)
endef

helloword-go:
	$(call docker_build, $(HELLOWORD_GO_PATH), $(HELLOWORD_GO))

helloword-nginx:
	$(call docker_build, $(HELLOWORD_NGINX_PATH), $(HELLOWORD_NGINX))

proxy-nginx:
	$(call docker_build, $(PROXY_NGINX_PATH), $(PROXY_NGINX))
