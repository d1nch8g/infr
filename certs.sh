docker compose down
go install github.com/go-acme/lego/v4/cmd/lego@latest
sudo lego --email="dancheg97@fmnx.su" --domains="fmnx.su" --http run
sudo lego --email="dancheg97@fmnx.su" --domains="ci.fmnx.su" --http run
sudo lego --email="dancheg97@fmnx.su" --domains="up.fmnx.su" --http run
sudo lego --email="dancheg97@fmnx.su" --domains="pk.fmnx.su" --http run
sudo chown -R dancheg97:dancheg97 .lego
docker compose up