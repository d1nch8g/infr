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
	sudo chown -R dancheg97:dancheg97 .lego

.PHONY: earl-gray
earl-gray:
	wget https://raw.githubusercontent.com/acoolstraw/earl-grey/master/theme-earl-grey.css
	cp theme-earl-grey.css gitea/gitea/css/theme-earl-grey.css
	rm theme-earl-grey.css

.PHONY: backup
backup:
	mkdir -p backups/$(shell date +"%m-%d-%y")
	scp -r dancheg97@192.168.1.69:~/Documents/composer backups/$(shell date +"%m-%d-%y")
	
.PHONY: delgit
delgit:
	rm -r backups/$(shell date +"%m-%d-%y")/composer/.git

# cd ~/Documents/composer;git pull;docker comopose down;docker compose up -d
