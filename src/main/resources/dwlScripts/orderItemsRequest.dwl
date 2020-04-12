%dw 2.0
output application/json
var quote = vars.quoteQueryResponse[0]
var order = vars.orderCreateResponse[0]
---
quote.QuoteLineItems map {
	OrderId:order.id,
	QuoteLineItemId:$.Id,
	Product2Id: $.Product2Id,
	PricebookEntryId: $.PricebookEntryId,
	Description: $.Description default "",
	Quantity: $.Quantity,
	UnitPrice: $.UnitPrice
}