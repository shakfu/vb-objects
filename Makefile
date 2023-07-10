
.PHONY: build clean reset


all: build

build:
	@mkdir -p build && cd build && cmake -G Xcode .. && cmake --build . --config 'Release'

clean:
	@rm -rf build

reset: clean
	@rm -rf externals
