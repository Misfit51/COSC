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




    ***Use an array to iterate and open the following

        Notepad

        MS Edge

        MSpaint

    Query the processes

    Kill the processes from PowerShell***

$procs = "notepad", "MSEdge", "mspaint"
$procs | ForEach-Object { Start-Process $_ }
$procs | ForEach-Object { Stop-Process -name $_ }

Get-Process | Where-Object{$_.name -like "*MS*"}


***Use an array to iterate and open the following

    Notepad

    MS Edge

    MSpaint

Query the processes and display only the following information in order by process ID

    Process ID

    Process Name

    The time the process started

    The amount of time the process has spent on the processor

    The amount of memory assigned to the process***



$procs = "notepad", "MSEdge", "mspaint"
$procs | ForEach-Object { Start-Process $_ }
$procs | ForEach-Object { Stop-Process -name $_ }

$file = "$pwd\procs.txt"
$procs | ForEach-Object { Start-Process $_ }
foreach($proc in $procs){
    get-process | Where-Object{$_.Name -like $proc} | ForEach-Object{Add-Content $file $_.Id} }
Get-Content .\procs.txt | ForEach-Object{Stop-Process $_}

foreach($proc in $procs){
    Get-Process | Where-Object{$_.Name -like $proc} | Format-Table -Property id, name, starttime, totalprocessortime, VirtualMemorySize, WorkingSet64 }

Get-Process | Where-Object{$_.name -like "*MS*"}



***join and split***
***Building block for test answer evaluating IPs***

foreach($oct in ('8.8.8.8' -split '\.')){
    if ([int]$oct -lt 0 -or [int]$oct -gt 255){
        "$oct is not a valid octet"
        }
        else {"$oct is a valid octet"}
    }

#'8.8.8.8' -split '\.'

'cat','dog' -join " "
'cat'.startswith('')
'dog'.endswith('')

$empty[3][3][0]
