
restart:
	docker compose pull
	docker compose down
	sudo rm -rf repo
	docker compose up
