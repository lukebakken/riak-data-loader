.PHONY: install-deps

install-deps:
	bundler install --binstubs --path vendor

update-deps:
	bundler update
