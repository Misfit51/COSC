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
