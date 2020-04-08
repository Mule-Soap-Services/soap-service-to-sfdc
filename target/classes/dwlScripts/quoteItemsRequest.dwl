%dw 2.0
output application/java
---
vars.incomingPayload.items.*OrderItem map {
        "Product2Id": vars.product2QueryResponse[0].Id,
        "PricebookEntryId": vars.priceBookEntryQueryResponse[0].Id,
        "UnitPrice": vars.priceBookEntryQueryResponse[0].UnitPrice,
        "Quantity": $.Quantity,
        "QuoteId": vars.quoteResponse[0].id
    }