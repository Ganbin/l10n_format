//%attributes = {}
TRUNCATE TABLE:C1051([Invoice:1])


For ($i;1;100)
	$invoice:=ds:C1482.Invoice.new()
	$invoice.total:=Round:C94((Random:C100/Random:C100)*1000;2)
	If (($i%2)=0)
		$invoice.country:="spain"
	Else 
		$invoice.country:="mexico"
	End if 
	$invoice.save()
End for 
ALERT:C41("100 Invoices generated")