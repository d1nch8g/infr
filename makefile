.PHONY: run
run:
	docker compose down
	docker compose up

.PHONY: cert
cert:
	go install github.com/go-acme/lego/v4/cmd/lego@latest
	sudo lego --email="dangdancheg@gmail.com" --domains="dancheg97.ru" --http run
	sudo lego --email="dangdancheg@gmail.com" --domains="gitea.dancheg97.ru" --http run
	sudo lego --email="dangdancheg@gmail.com" --domains="drone.dancheg97.ru" --http run
	sudo lego --email="dangdancheg@gmail.com" --domains="pocketbase.dancheg97.ru" --http run
	sudo lego --email="dangdancheg@gmail.com" --domains="aur.dancheg97.ru" --http run
	sudo lego --email="dangdancheg@gmail.com" --domains="pacman.dancheg97.ru" --http run
	sudo chown -R dancheg97:dancheg97 .lego

.PHONY: earl-gray
earl-gray:
	wget https://raw.githubusercontent.com/acoolstraw/earl-grey/master/theme-earl-grey.css
	cp theme-earl-grey.css gitea/gitea/css/theme-earl-grey.css
	rm theme-earl-grey.css

.PHONY: backup
backup:
	mkdir -p backups/$(shell date +"%m-%d-%y")
	scp -r dancheg97@192.168.1.69:~/composer backups/$(shell date +"%m-%d-%y")
	
.PHONY: delgit
delgit:
	rm -r backups/$(shell date +"%m-%d-%y")/composer/.git


mail:
	docker run --rm -it -v "${PWD}/mail/certs/:/etc/letsencrypt/" -v "${PWD}/mail/logs/:/var/log/letsencrypt/" -p 80:80 certbot/certbot certonly --standalone -d mail.dancheg97.ru
	docker run --rm -it docker.io/mailserver/docker-mailserver:latest doveadm pw -s SHA512-CRYPT -u dancheg97 -p mailpwd

restart:
	docker compose down
	docker compose up -d
