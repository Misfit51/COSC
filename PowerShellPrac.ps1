<# 1 #>
function q1($var1,$var2,$var3,$var4) {
    <# Return the product of the arguments #>
    return $var1 * $var2 * $var3 * $var4

}
function q2($arr,$rows,$cols,$key) {
    <# Search the 2 dimensional array for the first occurance of key at column index 0
       and return the value at column index 9 of the same row.
       Return -1 if the key is not found.
    #>

     foreach($row in $arr){
        if($row[0] -eq $key){
            return $row[9] 
        }
    }
    return -1
}
function q3 {
    <# In a loop, prompt the user to enter positive integers one at time.
       Stop when the user enters a -1. Return the maximum positive
       value that was entered."   REMEMBER .length and Get-Content to open files
	#>
        $vals = @()
        do {
            $val = Read-Host
            if ([int]$val -ne -1) {
                $vals += $val
            }
        }until([int]$val -eq -1)
        return ($vals | Measure-Object -Maximum).Maximum

}
function q4($filename,$whichline) {
    <# Return the line of text from the file given by the `$filename
	   argument that corresponds to the line number given by `$whichline.
	   The first line in the file corresponds to line number 0."
	#>
        Get-Content $filename | Select-Object -Index $whichline
  	
}
function q5($path) {
    <# Return the child items from the given path sorted
       ascending by their Name
	#>
        Get-ChildItem $path 
}
function q6 {
    <# Return the sum of all elements provided on the pipeline
	#>
        $sum = 0
        foreach($num in $input){ $sum += $num}
        return $sum 
}
function q7 {
	<# Return only those commands whose noun is process #>
        Get-Command -Noun process

}
function q8($adjective) {
    <# Return the string 'PowerShell is ' followed by the adjective given
	   by the `$adjective argument
	#>    
        "PowerShell is $adjective"

}
function q9($addr) {
	<# Return `$true when the given argument is a valid IPv4 address,
	   otherwise return `$false. For the purpose of this function, regard
	   addresses where all octets are in the range 0-255 inclusive to
	   be valid.
	#>
      <#$ipv4 = '(?:[0-9]{1,3}\.){3}[0-9]{1,3}'
      if ($addr -match $ipv4){
        return $true
    }
      else{
        return $false
    }#>

    foreach($octet in $addr.split(".")){
    	if([int]$octet -lt 0 -or [int]$octet -gt 255){
     		return $false
       		}
	}
       return $true
}
function q10 ($filepath,$lasthash) {
    <# Return `$true if the contents of the file given in the
       `$filepath argument have changed since `$lasthash was
       computed. `$lasthash is the previously computed SHA256
       hash (as a string) of the contents of the file. #>

      $hash = Get-FileHash $filepath
      if ($hash -match $lasthash){
        return $false
      }
      else{
        return $true
      } 
        
}


sussy wussy
<# 4 #>
function q1($var2,$var3,$var4,$var5) {
    <# The parameters listed are the values of all angles
       in a polygon except one. Find and return the value
       of the remaining angle. If an impossible angle
       is found, return -1.
       The formula to find the sum of all angles of a
       polygon is `(n-2) * 180`, where `n` is the total
       number of angles. An impossible angle is one that
       is zero degrees (or less) or 360 degree (or more).
       #>
}
function q2($arr,$key) {
    <# Search the 2 dimensional array for the first occurance
      of key at column index 0 and return the value at column
      index 2 of the same row. Return -1 if the key is not found.
    #>
}
function q3 {
    <# In a loop, prompt the user to enter a string until
       the user enters an empty string (length of 0) to
       stop. Return the string with the maximum
       length that the user entered."
#>
}
function q4($filename,$start) {
    <# Return the line of text from the file given by the `$filename
  argument that begins with the text specified by `$start.
  If no line in the file begins with the `$start text, return
  $null."
#>
}
function q5($path) {
    <# Return the services in Stopped status sorted
       descending by their Name
#>
}
function q6($filename) {
    <# Write each of the elements provided on the pipeline to the
       file specified by the $filename argument on separate lines
#>
}
function q7 {
<# Return the list of all startup apps that have an
       AppId 'not ending in }'.
    #>
}
function q8($arr) {
    <# Combine the provided `$arr argument into a string separated
       by a '-' between each element and return
       this string #>
}
function q9($addr) {
<# Return `$true when the given argument is an IPv4 address
  within the class 'E' otherwise return `$false.
       For an IPv4 address to be within class 'E', it
       must fall within the range '240.0.0.0' to
       '254.255.255.255'.
#>
}
function q10 () {
    <# Return the current date/time as a string formatted in
       the following way:
       YearMonthDay@Hour:Minute:Second
       For example, If the current date/time is 5 minutes and
       2 seconds after 3 PM on February 8th, 2018, the return
       value should be:  20180208@15:05:02
    #>

}
