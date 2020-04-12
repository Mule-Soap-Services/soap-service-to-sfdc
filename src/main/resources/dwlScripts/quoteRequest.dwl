%dw 2.0
output application/java
var days = p('sfdc.create.quote.expirationdays')
var account = vars.accountResponse[0]
---
[{
	//AccountId: account.Id,
	Name: p('sfdc.create.opportunity.name') ++ (vars.incomingQuotePayload.shipToName default "") ++ " - " ++ (now() as String {format: "MMddyyyy"}),
	OpportunityId: vars.opportunityResponse[0].id,
	ExpirationDate: ((now() as Date) + ("P" ++ days ++"D") as Period) as Date,
	Pricebook2Id: vars.priceBookEntryResponse[0].Pricebook2.Id,
	Status: p('sfdc.create.quote.status'),
	ShippingStreet: vars.incomingQuotePayload.shipToAddress1,
	ShippingCity: vars.incomingQuotePayload.shipToCity,
	ShippingCountry: vars.incomingQuotePayload.shipToCountry,
	ShippingState: vars.incomingQuotePayload.shipToState,
	ShippingPostalCode: vars.incomingQuotePayload.shipToPostalCode,
	ShippingName: vars.incomingQuotePayload.shipToName,
	BillingCountry: account.BillingAddress.country,
	BillingCity: account.BillingAddress.city,
	BillingStreet: account.BillingAddress.street,
	BillingPostalCode: account.BillingAddress.postalCode,
	BillingState: account.BillingAddress.state,
	BillingName: account.Name,
	ShipToContact__c: vars.incomingQuotePayload.shipToContact,
	ShipToPhone__c: vars.incomingQuotePayload.shipToPhone
}]