xfreerdp /u:student /v:10.50.38.228 -dynamic-resolution +glyph-cache +clipboard

Basic cmdlets
basic math; or [MATH]::sqrt($array)
comparison operators; -le -ge -eq -ne 
logical operators -and -or
-match, -notmatch, -like, -notlike
array, jagged array
foreach, foreach-object, if, elseif, else, while
Where-Object
Do and Until and While
Properties and Methods
Accessing, Reading, Writing files
Process block for elements provided on the pipeline
Pipeline variables $_
-join() and .split()
Save user input; $var = read-host

get-help (cmdlet you want help with, like man page) -Examples
$var = 10 (declare variable)

$false
$true

Automatic variables
$_
$Matches
$input

Typecasting
[int]
[float]
[array]

([string]$false + 'hello world').GetType().Name \ get-member    ***EXAM*** use .Name
$true + 'hello world'


Get-Command -Noun Process
Get-Command -Verb Start
Get-Help *process
Get-Help *write*
Update-Help
Get-Process: Lists running processes ***Get-Member gives membership type
Get-Service: Displays services installed 
Write-Output: Writes an output to the screen
Read-Host: Takes user input
Sort-Object

$array = "gal", "dir", "echo", "?", "%", "ft"
$array | ForEach-Object[Get-Alias $_}

Set-Alias -Name gh -Value Get-Help ***Makes gh the alias for GetHelp

' ' literal
" " variable

1..5 | ForEach-Object {$PSitem+1}

Get-Process | Group-Object {$-.name.Substring(0,1).ToUpper() | ForEach-Object{($_.name + " ") * 7; "====="; $-.Group}

$array = (Get-Random -Minimum -10 -Maximum 1)..(Get-Random -Minimum 1 -Maximum 10)

[array]::reverse($array) ***Previous but in reverse

$array.Length
$reversed = $array[($array.Length-1)..0]

PIPELINE
***Display the start time of the earliest and latest running processes***
Get-Process | Measure-Object -Property Starttime -minimum -maximum | Select-Object -Property Minimum, Maximum

***Identify a cmdlet that returns the current date and time then using this cmdlet and Select-object, display only the current day of the week***
Get-Date | Select-Object -Property DayOfWeek

***Identify a cmdlet that displays a list of installed hotfixes.***
Get-Hotfix

***Extend the expression to sort the list by install date, and display only the install date and hotfix ID.***
Get-HotFix | Sort InstalledOn | Select-Object HotfixID, InstalledOn

***Extend the expression further, but this time sort by description, include description, hotfix ID, and install Date.***
Get-HotFix | Sort Description | Select-Object HotfixID, Source, Description


COMPARISON AND CONDITION
***Find and extract the model number from the provided lines of text. If there isn’t a model number then display to the user that a model number wasn’t found***

$line1 = "Do you have model number: MT5437 for john.doe@sharklasers.com?"
$line2 = "What model number for john.doe@sharklasers.com?"

$pattern = $pattern = '[A-Z]{2}[0-9]{4}'

$line1,$line2 | ForEach-Object {
    if ($_ -match $pattern){
    Write-Host $Matches[0]": $_"
    }
    else{
    Write-Host "No matches found on: $_"
    }
}

'MT5437',1 -match '[A-Z]{2}[0-9]{4}'
$Matches


$x = 2
if ($x -eq 5) {
  Write-Host "Bob"
}
elseif ($x -eq 4) {
  Write-Host "Sue"
}
elseif ($x -eq 2 {
  "Tom"
}
elseif ($x -gt 1) {
  "Mary"
}
else {
  "Who am i?"
}


****************Jagged Array, foreach (<condition>), Do until, Process block, While,**************************

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



**********************-join() and .split()*******************

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

function 
    "elements provided on the pipeline"
    Cool-Printer{
Begin{
}
Process{
}
End{
}


********************************** Elements provided on a pipeline
function Cool-Printer{
process{$_}
}

1,2,3,4,5

function Get-Sum{
Begin{$sum=0}
process{$sum += $_}
End {$sum}}
**********************************
Get-Content
Add-Content
***************************
function bare-bones {
    Param(Define Parameters)
    Begin {code}
    Process {code}
    End {code}
    }
***************************

Get-Process | Where-Object {$_.name -like "*ms*"} | Select-Object -Property ProcessName, Id, WS

do {
    codeblock
}while(condition)

$num = 4
do {
    $num
    $num ++
}while($false)

*******Do while VS Do Until**********

do {
    codeblock
}until(condition)

$num = 0
do {
    $num
    $num ++
}until($num -gt 3)
*************************************

function Print-Input{
Write-Output "$input"}

function Print-PSitem{
Process{Write-Output "$PSItem"}
}

*************************************

function Print-Input{
$sum = 0
foreach($num in $input){
$num
$sum += $num}
$sum
}

Output:
1
2
3
6
***********************************

Measure-Object

