HELLOWORD_GO=njavilas/helloword:go
HELLOWORD_GO_PATH=helloword_go


define docker_build
	cd $(1) && docker build -t $(2) -f Dockerfile .
	docker push $(2)
endef

helloword-go:
	$(call docker_build, $(HELLOWORD_GO_PATH), $(HELLOWORD_GO))
