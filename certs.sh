docker compose down
go install github.com/go-acme/lego/v4/cmd/lego@latest
sudo lego --email="help@fmnx.io" --domains="fmnx.io" --http run
sudo lego --email="help@fmnx.io" --domains="ci.fmnx.io" --http run
sudo lego --email="help@fmnx.io" --domains="up.fmnx.io" --http run
sudo lego --email="help@fmnx.io" --domains="repo.fmnx.io" --http run
sudo lego --email="help@fmnx.io" --domains="logs.fmnx.io" --http run
sudo lego --email="help@fmnx.io" --domains="docs.fmnx.io" --http run
sudo lego --email="help@fmnx.io" --domains="tree.fmnx.ru" --http run
sudo lego --email="help@fmnx.io" --domains="articles.fmnx.ru" --http run
sudo chown -R dancheg97:dancheg97 .lego
docker compose up