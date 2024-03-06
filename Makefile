SERVER=satnam@178.128.162.15

.PHONY: build serve

build:	
	bundler exec jekyll build

serve:
	bundler exec jekyll serve --watch 	

push:	build
		scp -r _site/* $(SERVER):public_html

rpush:	build
	scp -r _site/* satnam@oban.raintown.org:public_html

inc:	build
		scp  _site/abuse/index.html $(SERVER):public_html/abuse/index.html
		scp _site/images/scholar.png $(SERVER):public_html/images/
