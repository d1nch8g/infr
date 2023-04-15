docker compose down
go install github.com/go-acme/lego/v4/cmd/lego@latest
sudo lego --email="help@fmnx.ru" --domains="fmnx.ru" --http run
sudo lego --email="help@fmnx.ru" --domains="ci.fmnx.ru" --http run
sudo lego --email="help@fmnx.ru" --domains="up.fmnx.ru" --http run
sudo lego --email="help@fmnx.ru" --domains="pkg.fmnx.ru" --http run
sudo lego --email="help@fmnx.ru" --domains="logs.fmnx.ru" --http run
sudo lego --email="help@fmnx.ru" --domains="docs.fmnx.ru" --http run
sudo lego --email="help@fmnx.ru" --domains="tree.fmnx.ru" --http run
sudo lego --email="help@fmnx.ru" --domains="cloud.fmnx.ru" --http run
sudo chown -R dancheg97:dancheg97 .lego
docker compose up