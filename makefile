# Makefile

BUILD_DIR := ./Dockerfile
GHCR_USERNAME := yqlbu
IMAGE_NAME := github-tag-autoincrement
IMAGE_TAG := latest

GITHUB_USERNAME := yqlbu
GITHUB_TOKEN := $(GHCR_TOKEN)
GITHUB_REPO_NAME := github-tag-autoincrement
GITHUB_MESSAGE := yqlbu
TAG_PREFIX := v

# List of commands
build:
	@docker build -f $(BUILD_DIR) \
		-t ghcr.io/$(GHCR_USERNAME)/$(IMAGE_NAME):$(IMAGE_TAG) \
		.

push: ghcr-login
	@docker push ghcr.io/$(GHCR_USERNAME)/$(IMAGE_NAME):latest


ghcr-login:
	@echo $(GHCR_TOKEN) | docker login ghcr.io -u $(GHCR_USERNAME) --password-stdin

read:
	@docker run -it --rm --name $(IMAGE_NAME) \
		-e "GITHUB_API_REPO_URL=https://api.github.com/repos/$(GITHUB_USERNAME)/$(GITHUB_REPO_NAME)" \
  	-e "TAG_PREFIX=$(TAG_PREFIX)" \
  	-e "GITHUB_USERNAME=$(GITHUB_USERNAME)" \
  	-e "GITHUB_TOKEN=$(GITHUB_TOKEN)" \
  	-e "MODE=READONLY" \
		ghcr.io/$(GHCR_USERNAME)/$(IMAGE_NAME):$(IMAGE_TAG)

write:
	@docker run -it --rm --name $(IMAGE_NAME) \
		-e "GITHUB_API_REPO_URL=https://api.github.com/repos/$(GITHUB_USERNAME)/$(GITHUB_REPO_NAME)" \
  	-e "TAG_PREFIX=$(TAG_PREFIX)" \
  	-e "GITHUB_USERNAME=$(GITHUB_USERNAME)" \
  	-e "GITHUB_TOKEN=$(GITHUB_TOKEN)" \
  	-e "MODE=WRITE" \
		ghcr.io/$(GHCR_USERNAME)/$(IMAGE_NAME):$(IMAGE_TAG)

apply:
	@docker run -it --rm --name $(IMAGE_NAME) \
		-e "GITHUB_API_REPO_URL=https://api.github.com/repos/$(GITHUB_USERNAME)/$(GITHUB_REPO_NAME)" \
  	-e "TAG_PREFIX=$(TAG_PREFIX)" \
  	-e "GITHUB_USERNAME=$(GITHUB_USERNAME)" \
  	-e "GITHUB_TOKEN=$(GITHUB_TOKEN)" \
		ghcr.io/$(GHCR_USERNAME)/$(IMAGE_NAME):$(IMAGE_TAG)
