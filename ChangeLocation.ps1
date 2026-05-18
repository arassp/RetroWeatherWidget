[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

Add-Type -AssemblyName Microsoft.VisualBasic
Add-Type -AssemblyName System.Windows.Forms

$loc = [Microsoft.VisualBasic.Interaction]::InputBox('Enter a city name or US zip code:', 'Change Weather Location', '')

if ([string]::IsNullOrWhiteSpace($loc)) { exit }

$r = Invoke-RestMethod -Uri ("https://geocoding-api.open-meteo.com/v1/search?name=" + [Uri]::EscapeDataString($loc) + "&count=1&language=en&format=json") -UseBasicParsing

if (-not $r.results) {
    [System.Windows.Forms.MessageBox]::Show('Location not found. Try being more specific (e.g. "Paris, France").', 'Not Found')
    exit
}

$p = $r.results[0]
$n = $p.name
if ($p.admin1) { $n += ", " + $p.admin1 }
if ($p.country_code) { $n += ", " + $p.country_code }

# Get the ini file path from the same folder as this script
$ini = Join-Path $PSScriptRoot "Retroweather.ini"

$c = Get-Content $ini -Raw
$c = $c -replace '(?m)^Latitude=.*$', "Latitude=$($p.latitude)"
$c = $c -replace '(?m)^Longitude=.*$', "Longitude=$($p.longitude)"
$c = $c -replace '(?m)^Location=.*$', "Location=$n"
Set-Content $ini $c -NoNewline
