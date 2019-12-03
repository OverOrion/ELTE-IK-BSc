$a = [int] (Read-Host("Give me a number"))

if ($a -le 1) {
    echo "Nem prím."}
elseif ($a -eq 2) {
    echo "Prím."    
    }
else {
    if (($a % 2) -eq 0) {
        echo "Nem prím."
        }
    else {
        for ($i = 3; $i -le [System.Math]::Sqrt($number); $i++){
            if (($number % $i) -eq 0){
                echo "Nem prím."
                break
                }
            echo "Prím."
            }
        
        
        
        }
    
    
    }
