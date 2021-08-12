
# create app network:
docker network create ps-330-wired-brain

# database:
docker run -d --network ps-330-wired-brain `
    --name products-db `
    -e POSTGRES_PASSWORD=wired `
    psdockerrun/products-db

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
