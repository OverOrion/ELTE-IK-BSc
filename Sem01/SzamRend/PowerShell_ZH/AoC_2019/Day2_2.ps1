$array_of_commands = (Get-Content .\Day2_input.txt).split(',').ForEach( { [int]$psitem })


for ($j = 0; $j -le 99; $j++) {
    for ($k = 0; $k -le 99; $k++) {
        for ($i = 0; $i -lt $array_of_commands.count ; $i += 4) {       
$array_of_commands = (Get-Content .\Day2_input.txt).split(',').ForEach( { [int]$psitem })
        $array_of_commands[2] = $k
        $array_of_commands[1] = $j
        $array_of_commands[0] = 1
            $starter = $array_of_commands[$i]
            $cnt = $i
            $val1Position = $array_of_commands[$cnt + 1]
            $val1 = $array_of_commands[$val1Position]
            $val2Position = $array_of_commands[$cnt + 2]
            $val2 = $array_of_commands[$val2Position]

            $outputPosition = $array_of_commands[$cnt + 3]
            if ($starter -eq 1) {
                $output = $val1 + $val2

                $array_of_commands[$outputPosition] = $output
            }
            elseif ($starter -eq 2) {
                $output = $val1 * $val2

                $array_of_commands[$outputPosition] = $output
            }
            elseif (-$starter -eq 99) {
                $array_of_commands
                exit
            }
        }
        if ($array_of_commands[0] -eq 19690720) {
            $array_of_commands[1]
            $array_of_commands[2]
        }
}
}
