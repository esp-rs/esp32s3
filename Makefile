all: clean generate form fmt build

codegen: clean generate form fmt build

clean:
	rm -rf src/

generate:
	svd2rust --target xtensa-lx -i svd/esp32s3.svd

form:
	form -i lib.rs -o src/
	rm lib.rs

fmt:
	cargo fmt

build:
	cargo clean
	cargo +esp build --target xtensa-esp32s3-none-elf
