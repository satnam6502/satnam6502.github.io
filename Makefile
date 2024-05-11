SERVER=satnam@oban.raintown.org
HR=raintow@ssh.raintown.org

.PHONY: build serve sva

build:	
	bundler exec jekyll build

serve:
	bundler exec jekyll serve --watch 	

push:	build
		scp -r _site/* $(SERVER):public_html

rpush:	build
	scp -r _site/* satnam@oban.raintown.org:public_html

hrpush:	build
		scp -r _site/* $(HR):public_html

inc:	build
		# scp _site/images/saison-*.jpg $(SERVER):public_html/images
		scp  -r _site/celiac/* $(SERVER):public_html/celiac


sva:		build
		scp -r  _site/sva $(SERVER):public_html
