
# 08/15/2012 04:38 am - SSN 

param ( [switch]$doCompose = $true)

docker network create ps-330-wb-net

docker ps -a -f network=demo2_ps-330-wb-net -q | % { docker rm $_ -f }

if (  $doCompose  ) {
    write-host "Composing..." -ForegroundColor Green
    docker-compose up -d
}
else {
    write-host "Bypassing compose." -ForegroundColor Yellow

}
