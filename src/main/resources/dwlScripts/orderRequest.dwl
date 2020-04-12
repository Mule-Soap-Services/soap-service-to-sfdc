%dw 2.0
output application/java
var quote = vars.quoteQueryResponse[0]
var contract = vars.contractQueryResponse[0]
---
[{
	AccountId: quote.AccountId,
	OpportunityId: quote.OpportunityId,
	ContractId: contract.Id,
	EffectiveDate: (now() as Date),
	Status: p('sfdc.order.status.draft'),
	Quote__c: quote.Id,
	PoNumber: vars.incomingPayload.poNumber,
	End_User_PoNumber__c: vars.incomingPayload.endUserPoNumber,
	BillingCountry: quote.BillingAddress.country,
	BillingCity: quote.BillingAddress.city,
	BillingStreet: quote.BillingAddress.street,
	BillingPostalCode: quote.BillingAddress.postalCode,
	BillingState: quote.BillingAddress.state,
	ShippingCountry: quote.ShippingAddress.country,
	ShippingCity: quote.ShippingAddress.city,
	ShippingStreet: quote.ShippingAddress.street,
	ShippingPostalCode: quote.ShippingAddress.postalCode,
	ShippingState: quote.ShippingAddress.state
}]