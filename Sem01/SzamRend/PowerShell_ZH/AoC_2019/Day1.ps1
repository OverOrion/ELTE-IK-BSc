### Specifically, to find the fuel required for a module, take its mass, divide by three, round down, and subtract 2.

$sum=0
foreach ($line in Get-Content .\Day1_input.txt)
{
    $sum+=[Math]::Floor((([int]$line/3)))-2
}
$sum