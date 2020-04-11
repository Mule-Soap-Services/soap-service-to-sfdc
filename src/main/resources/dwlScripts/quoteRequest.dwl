%dw 2.0
output application/java
var days = p('sfdc.create.quote.expirationdays')
---
{
	"Name": "Zoom HaaS  - " ++  vars.incomingQuotePayload.shipToName ++ (now() as String {format: "MMddyyyyHHMM"}),
	"OpportunityId": vars.opportunityResponse[0].id,
	"ExpirationDate": (now() as Date) + ("P" ++ days ++"D") as Period,
	"Pricebook2Id": vars.priceBookEntryResponse[0].Pricebook2.Id,
	"Status": p('sfdc.create.quote.status'),
	"ShippingStreet": vars.incomingQuotePayload.shipToAddress1,
	"ShippingCity": vars.incomingQuotePayload.shipToCity,
	"ShippingCountry": vars.incomingQuotePayload.shipToCountry,
	"ShippingState": vars.incomingQuotePayload.shipToState,
	"ShippingPostalCode": vars.incomingQuotePayload.shipToPostalCode,
	"ShippingName": vars.incomingQuotePayload.shipToName
}