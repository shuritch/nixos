# Wrapper for meson and ninja

.PHONY: all install uninstall run clean meson

all: meson
	cd build && ninja

install: meson
	cd build && ninja install

uninstall:
	@rm -f "/usr/local/bin/iio-hyprland" || echo "Error: permission denied (try running with sudo)"

run: all
	build/iio-hyprland

clean:
	rm -rf build

meson:
	meson build
