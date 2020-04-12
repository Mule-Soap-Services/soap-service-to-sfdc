%dw 2.0
output application/java
---
vars.incomingQuotePayload.items.*OrderItem map {
        Product2Id: vars.priceBookEntryResponse[0].Product2.Id,
        Description: vars.priceBookEntryResponse[0].Product2.Description,
        PricebookEntryId: vars.priceBookEntryResponse[0].Id,
        UnitPrice: vars.priceBookEntryResponse[0].UnitPrice,
        Quantity: $.Quantity,
        QuoteId: vars.createQuoteResponse[0].id
    }