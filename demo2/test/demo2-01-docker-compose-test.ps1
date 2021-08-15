
# 08/15/2012 05:49 am - SSN   

param ( [switch]$doCompose = $true)

docker network create ps-330-wb-net

docker ps -a -f network=test_ps-330-wb-net -q | % { docker rm $_ -f }

if (  $doCompose  ) {
    write-host "Composing..." -ForegroundColor Green
    docker-compose up -d
}
else {
    write-host "Bypassing compose." -ForegroundColor Yellow

}
