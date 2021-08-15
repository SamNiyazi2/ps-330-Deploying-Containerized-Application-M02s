
# 08/15/2012 04:38 am - SSN 

docker network create ps-330-wb-net

docker ps -a -f network=demo2_ps-330-wb-net -q | % { docker rm $_ -f }

docker-compose up -d

explorer http://localhost:8080/