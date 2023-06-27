
gitadd:
	git remote add github https://github.com/fmnx-su/infr
	git remote add codeberg https://codeberg.org/fmnx/infr

push:
	git push
	git push github
	git push codeberg

restart:
	docker compose pull
	docker compose down
	sudo rm -rf repo
	docker compose up
