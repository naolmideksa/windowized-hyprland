# Makefile for kyprland Hyprland plugin

CXX ?= g++
CXXFLAGS ?= -O2 -shared -fPIC -std=c++2b --no-gnu-unique
INCLUDES = `pkg-config --cflags pixman-1 libdrm hyprland libinput libudev wayland-server xkbcommon lua`
TARGET = kyprland.so
SRC = main.cpp

all: $(TARGET)

$(TARGET): $(SRC)
	$(CXX) $(CXXFLAGS) $(INCLUDES) $^ -o $@

clean:
	rm -f $(TARGET)

.PHONY: all clean
