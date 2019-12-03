#Parrag Szilárd - LA68T1
param (
	[string]$file = $( Read-Host "Add meg a fájlt!" )
)
# check for file

if (!(Test-Path $file)) {
  Write-Warning "$file nem létezik"
  exit
}

$oddSum = 0 
$evenSum = 0

$rows = Get-Content $file | Measure-Object -Line | Select-Object -expand Lines

for ($line = 0; $line -lt $rows; $line++){
$currentLine = (Get-Content $file)[$line].split(',')
#checking elements
	for ($i = 0; $i -lt $currentLine.count; $i++){
		#line 1 == index 0; --> ODD
		if ( ($line % 2) -eq 0 -And ($currentLine[$i] % 2) -eq 1) {
			$oddSum += $currentLine[$i]
			}
			#line 2 == index 1; --> EVEN
		elseif (($line % 2) -eq 1 -And ($currentLine[$i] % 2) -eq 0) {
			$evenSum += $currentLine[$i]
			}
	}
}
echo "páratlanok összege: $oddSum "
echo "párosok összege: $evenSum"
