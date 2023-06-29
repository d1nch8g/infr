docker compose down
go install github.com/go-acme/lego/v4/cmd/lego@latest
sudo lego --email="dancheg@fmnx.su" --domains="fmnx.su" --http run
sudo chown -R dancheg97:dancheg97 .lego
docker compose up