# vim: ts=2:sw=2

JS       := spinner
JS_FILES := $(patsubst %, js/%.js, $(JS))

.PHONY: js all clean

js/%.js: coffee/%.coffee
	@test -d js || mkdir js
	coffee --output js -c $<

all: build

js: $(JS_FILES)

clean:
	rm -rf js
