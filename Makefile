SERVER=satnam@oban.raintown.org

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
		scp  _site/bio/index.html $(SERVER):public_html/bio
