//%attributes = {}

C_REAL:C285($1;$total)
C_TEXT:C284($2;$country)
C_TEXT:C284($0;$total_txt)
C_TEXT:C284($int_txt;$dec_txt;$number_txt;$decimalSeparator;$thousandSeparator)
C_COLLECTION:C1488($int_col;$dec_col)

$total:=$1
$country:=$2
$total_txt:=""
$int_txt:=String:C10(Int:C8($total))
$dec_txt:=String:C10(Dec:C9($total))

$int_col:=Split string:C1554($int_txt;"").reverse()
$dec_col:=Split string:C1554($dec_txt;"")
$dec_col.shift()  // Remove the 0
$dec_col.shift()  // Remove the decimal separator

Case of 
	: ($country="spain")
		$thousandSeparator:=","
		$decimalSeparator:="."
		
	: ($country="mexico")
		$thousandSeparator:="."
		$decimalSeparator:=","
		
	Else 
		$thousandSeparator:=" "
		$decimalSeparator:="."
End case 


$count:=0
For each ($number_txt;$int_col)
	If (($count%3)=0) & ($total_txt#"")
		$total_txt:=$thousandSeparator+$total_txt
	End if 
	$total_txt:=$number_txt+$total_txt
	$count:=$count+1
End for each 

If ($dec_col.length>0)
	$total_txt:=$total_txt+$decimalSeparator
	For each ($number_txt;$dec_col)
		$total_txt:=$total_txt+$number_txt
	End for each 
End if 

$0:=$total_txt