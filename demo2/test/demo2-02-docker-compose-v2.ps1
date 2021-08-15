
# 08/15/2012 06:07 am - SSN   
 
docker network create ps-330-wb-net

docker ps -a -f network=test_ps-330-wb-net -q | % { docker rm $_ -f }
  
docker-compose -f ./test-v2.yml up -d

explorer http://localhost:8010
