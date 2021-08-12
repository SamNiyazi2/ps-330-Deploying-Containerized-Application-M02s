
$ErrorActionPreference = "stop"

$lf = "`r`n" 
$lf * 10
$d = Get-Date
write-host $d

# $action = 1 # delete container
# $action = 2 # start container (Fix: products-api and products-db exit on initial startup)

$action = 0


$filter = 'psdockerrun'

if ($action -eq 2) {

    $filter = 'psdockerrun/products-'

}

docker ps -a | % {


    if ( $_.contains($filter)) {

        write-host "--"
        write-host $_
        [string]$s = $_
        $a = $s.Split(' ')

        write-host $a[0]

        if ($action -eq 1) {
            write-host "Remove containre" -ForegroundColor Red
            docker rm $a[0] -f
        }

        if ($action -eq 2) {
            write-host "Start containre" -ForegroundColor Green
            docker start $a[0] 
        }

    }

}


$lf * 2

write-host "Done" -ForegroundColor Green

$lf * 2
