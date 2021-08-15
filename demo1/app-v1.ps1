
# create app network:
docker network create ps-330-wired-brain


# 08/15/2021 02:40 am - SSN - Remove existing containers
docker ps -a -f network=ps-330-wired-brain -q | % { docker rm $_ -f }

# database:

# 08/15/2021 02:34 am - SSN - Temp fix
# psdockerrun/products-db
# Relace with postgres
# Using /demo/db/dockerfile
# docker build -t ps-330-products-db-test-20210815 .

docker run -d --network ps-330-wired-brain `
    --name products-db `
    -e POSTGRES_PASSWORD=wired `
    ps-330-products-db-test-20210815

# products API:
docker run -d --network ps-330-wired-brain `
    --name products-api `
    -p 8081:80 `
    psdockerrun/products-api

# stock API:
docker run -d --network ps-330-wired-brain `
    --name stock-api `
    -p 8082:8080 `
    psdockerrun/stock-api

# website
docker run -d --network ps-330-wired-brain `
    --name web `
    -p 8080:80 `
    psdockerrun/web

    

# psdockerrun/products-api and  psdockerrun/products-db fail after start.  They can be started manually.
# Initial data is missing.


# http://localhost:8080/
