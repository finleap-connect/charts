BUILD_PATH 					?= $(shell pwd)

HELM      					?= helm
HELM_OUTPUT_DIR     ?= $(BUILD_PATH)/tmp

export 

# helm

helm-add-finleap-connect:
	@$(HELM) repo add finleap-connect https://finleap-connect.github.io/charts/
	@$(HELM) repo update

helm-lint:
	$(HELM) lint charts/*