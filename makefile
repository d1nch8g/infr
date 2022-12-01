
.PHONY: clean
clean:
	docker compose down
	sudo rm -r gitea

.PHONY: run
run:
	docker compose down
	docker compose up

.PHONY: theme
theme:
	mkdir --parents gitea/gitea/templates/custom
	cp body_outer_pre.tmpl gitea/gitea/templates/custom/body_outer_pre.tmpl
	echo '[ui]' >> gitea/gitea/conf/app.ini
	echo 'THEMES = gitea,arc-green,plex,aquamarine,dark,dracula,hotline,organizr,space-gray,hotpink,onedark,overseerr,nord' >> gitea/gitea/conf/app.ini
	echo 'DEFAULT_THEME = dracula' >> gitea/gitea/conf/app.ini
	docker compose down
	docker compose up -d

.PHONY: cert
cert:
	go install github.com/go-acme/lego/v4/cmd/lego@latest
	sudo lego --email="dangdancheg@gmail.com" --domains="dancheg97.ru" --http run
	sudo lego --email="dangdancheg@gmail.com" --domains="gitea.dancheg97.ru" --http run
	sudo lego --email="dangdancheg@gmail.com" --domains="drone.dancheg97.ru" --http run
	sudo chown -R dancheg97:dancheg97 .lego
