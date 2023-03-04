docker compose down
go install github.com/go-acme/lego/v4/cmd/lego@latest
sudo lego --email="dangdancheg@gmail.com" --domains="dancheg97.ru" --http run
sudo lego --email="dangdancheg@gmail.com" --domains="gitea.dancheg97.ru" --http run
sudo lego --email="dangdancheg@gmail.com" --domains="drone.dancheg97.ru" --http run
sudo lego --email="dangdancheg@gmail.com" --domains="pocketbase.dancheg97.ru" --http run
sudo lego --email="dangdancheg@gmail.com" --domains="pacman.dancheg97.ru" --http run
sudo lego --email="dangdancheg@gmail.com" --domains="kuma.dancheg97.ru" --http run
sudo lego --email="dangdancheg@gmail.com" --domains="dozzle.dancheg97.ru" --http run
sudo chown -R dancheg97:dancheg97 .lego
docker compose up