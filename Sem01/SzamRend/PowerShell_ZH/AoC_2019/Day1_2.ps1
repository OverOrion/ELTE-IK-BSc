### Specifically, to find the fuel required for a module, take its mass, divide by three, round down, and subtract 2.

$sum=0
foreach ($line in Get-Content .\Day1_input.txt)
{
    $moduleMass=[Math]::Floor((([int]$line/3)))-2
    $sum+=$moduleMass
    $moduleMass = [Math]::Floor((([int]$moduleMass/3)))-2
    while ($moduleMass -gt 0) 
    {
        $sum+=$moduleMass
        $moduleMass = [Math]::Floor((([int]$moduleMass/3)))-2
    }
}
$sum