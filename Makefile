FOX32ASM := ../fox32asm/target/release/fox32asm
OKAMERON := $(CURDIR)/meta/okameron/okameron.lua
GFX2INC := ../tools/gfx2inc/target/release/gfx2inc

all: fl.fxf

fl.fxf: src/FoxLights.okm $(wildcard src/*.okm)
	lua $(OKAMERON) -arch=fox32 -startup=src/start.asm $< \
		src/OS.okm \
		> src/foxlights.asm
	$(FOX32ASM) src/foxlights.asm $@
	rm src/foxlights.asm

clean:
	rm -f fl.fxf
