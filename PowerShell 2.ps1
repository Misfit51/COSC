Jagged Array, foreach (<condition>), Do until, Process block, While,

$BB = " "

foreach($fish in $BB){
    if ($fish -like 'SPONGE'){

***This regex string will help later***  '^L.*r$' -match 'Larry the lobster'

$num = 0
$magic = 182
while($True){
    $num = [int](Read-Host -Prompt "Pick a number between 0 and 200")
    if ($num -lt $magic){
        "Too low!"
    }
    elseif($num -gt $magic){
        "Too high"
    }
    else{
        "blink-$magic"; break
    }
    
}


