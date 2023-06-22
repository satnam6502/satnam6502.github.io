.PHONY: build serve

build:	
	bundler exec jekyll build

serve:
	bundler exec jekyll serve --watch 	

push:	build
	./push.sh

inc:	build
		scp _site/abuse/index.html raintow@raintown.org:domains/raintown.org/public_html/abuse/index.html
