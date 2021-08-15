
# 08/15/2012 07:52 am - SSN 

param ( 
    $scaleStockApi = 0
)

write-host " "
write-host '  Hint: -scaleStockApi=<number of instances>'
write-host " "



docker network create ps-330-wb-net

docker ps -a -f network=demo3_ps-330-wb-net -q | % { docker rm $_ -f }
 
$dockerCommand = "docker-compose -f .\v2.yml up -d "

if ( $scaleStockApi -gt 0 ) {
    $dockerCommand = $dockerCommand + ' --scale stock-api-test={0}' -f $scaleStockApi  
}


Invoke-Expression $dockerCommand


explorer http://localhost:8010
