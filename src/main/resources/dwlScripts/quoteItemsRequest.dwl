%dw 2.0
output application/java
---
vars.incomingQuotePayload.items.*OrderItem map {
        "Product2Id": vars.priceBookEntryResponse[0].Product2.Id,
        "PricebookEntryId": vars.priceBookEntryResponse[0].Id,
        "UnitPrice": vars.priceBookEntryResponse[0].UnitPrice,
        "Quantity": $.Quantity,
        "QuoteId": vars.quoteResponse[0].id
    }