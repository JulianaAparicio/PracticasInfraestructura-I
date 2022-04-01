foreach($nombre in $(Get-Content -Path .\lista_nombres.txt)) {
  Write-Output "El nombre es $nombre"
  $gender = Invoke-RestMethod -Method Get -Uri https://api.genderize.io/?name=$nombre | Select-Object -ExpandProperty Gender
  $country = Invoke-RestMethod -Method Get -Uri https://api.nationalize.io/?name=$nombre | Select-Object -ExpandProperty Country | Select-Object -First 1 -Property country_id
  Write-Output "El género de $nombre es: $gender"
  Write-Output "El país de $nombre es: $($country.country_id)"

    if ($nombre -eq "Juan") {
      Write-Output "Encontré a $nombre"
    } else {
      $otrosNombres++
    }
}
 echo("La cantidad de nombres que no son Juan:" + $otrosNombres ); 
 
$req = Invoke-WebRequest -Method Get -Uri https://raw.githubusercontent.com/olea/lemarios/master/nombres-propios-es.txt
$nombresConA = $req.Content.split("`n") | Where-Object { $_ -like "A*" }
1..5 | ForEach-Object {
$random = Get-Random -Minimum 0 -Maximum $($nombresConA.count-1)
$nombresConA[$random]
}
$nombresConL = $req.Content.split("`n") | Where-Object { $_ -like "L*" }
1..5 | ForEach-Object {
$random = Get-Random -Minimum 0 -Maximum $($nombresConL.count-1)
$nombresConL[$random]
}
$nombresSinAL = $req.Content.split("`n") | Where-Object { $_ -notlike "L*" -and $_ -notlike "A*"  }
1..5 | ForEach-Object {
$random = Get-Random -Minimum 0 -Maximum $($nombresSinAL.count-1)
$nombresSinAL[$random]
}