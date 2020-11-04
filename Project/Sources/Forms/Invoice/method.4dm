$evt:=Form event code:C388

Case of 
	: ($evt=On Load:K2:1)
		Form:C1466.invoices:=ds:C1482.Invoice.all()
		
		Form:C1466.total:=""
End case 
