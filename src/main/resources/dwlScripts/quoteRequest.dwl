%dw 2.0
output application/java
var days = p('sfdc.create.quote.expirationdays')
---
{
	//"AccountId": p('sfdc.create.quote.accountid'),
	"Name": "Zoom HaaS  - " ++  vars.incomingPayload.shipToName ++ (now() as String {format: "MMddyyyyHHMM"}),
	"OpportunityId": vars.opportunityResponse[0].id,
	"ExpirationDate": (now() as Date) + ("P" ++ days ++"D") as Period,
	"Pricebook2Id": vars.priceBookEntryResponse[0].Pricebook2.Id,
	"Status": p('sfdc.create.quote.status'),
	"ShippingStreet": vars.incomingPayload.shipToAddress1,
	"ShippingCity": vars.incomingPayload.shipToCity,
	"ShippingCountry": vars.incomingPayload.shipToCountry,
	"ShippingState": vars.incomingPayload.shipToState,
	"ShippingPostalCode": vars.incomingPayload.shipToPostalCode,
	"ShippingName": vars.incomingPayload.shipToName
}