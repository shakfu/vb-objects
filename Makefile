
DEPENDENCIES = libsamplerate fftw aubio

.PHONY: check build update link setup clean reset


all: build

check:
	@brew --prefix > /dev/null || (echo "Homebrew not found"; exit 1)
	@for dep in $(DEPENDENCIES); do \
		brew --prefix $$dep > /dev/null || \
			(echo "$$dep not available, install via homebrew: 'brew install $$dep'"; \
				exit 1); \
	done

build:
	@mkdir -p build && cd build && cmake -G Xcode .. && cmake --build . --config 'Release'

update:
	git submodule init
	git submodule update

link:
	ln -s $(shell pwd) "$(HOME)/Documents/Max 8/Packages/$(shell basename `pwd`)"

setup: update link

clean:
	@rm -rf build

reset: check
	@rm -rf externals
