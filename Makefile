all:
	@echo desktop...install for desktop pc
	@echo laptop....install for laptop pc
	@echo It does not include drivers.

desktop:
	@./script/install.sh
	@./script/config.sh

laptop:
	@./script/install.sh
	@./script/laptop.sh
	@./script/config.sh
