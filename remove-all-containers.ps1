
# 08/15/2021 08:29 am - SSN 



function remove-network-containers {

    param ( 
        [parameter(ValueFromPipeline = $true)]
        $networkName 
    )

    process {

        docker ps -a -q -f network=$networkName  | % { docker rm $_ -f } 

    }
}

Write-Host " "
Write-Host "Network list"
Write-Host " "

docker network ls 

Write-Host " "
Write-Host " "

$networkNameList = @( 
    'demo2_ps-330-wb-net'
    'demo3_ps-330-wb-net' 
    'ps-330-wb-net'
    'test_ps-330-wb-net' 
)


$networkNameList | remove-network-containers 

Write-Host " "
Write-Host " "
Write-Host "docker network prune"
Write-Host " "

docker network prune -f 

Write-Host " "
Write-Host " "
Write-Host "Network list"
Write-Host " "

docker network ls 



