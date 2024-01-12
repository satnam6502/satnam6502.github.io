.PHONY: build serve

build:	
	bundler exec jekyll build

serve:
	bundler exec jekyll serve --watch 	

push:	build
	cp -r _site/* ~/public_html

rpush:	build
	scp -r _site/* satnam@oban.raintown.org:public_html

inc:	build
		scp _site/abuse/index.html raintow@raintown.org:domains/raintown.org/public_html/abuse/index.html
