$evt:=Form event code:C388

Case of 
	: ($evt=On Selection Change:K2:29)
		
		Form:C1466.total:=invoice_getTotalFormatted (Form:C1466.invoice.total;Form:C1466.invoice.country)
End case 
