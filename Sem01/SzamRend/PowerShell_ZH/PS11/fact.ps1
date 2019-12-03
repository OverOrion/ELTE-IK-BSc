param(
[int]$n
)

#Param([Parameter(Mandatory=$true)] [int]$n)
$fact=1
for ($i = 1; $i -le $n; ++$i){
    $fact = $fact * $i    
    }
write-output $fact
