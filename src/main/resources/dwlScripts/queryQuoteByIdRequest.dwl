%dw 2.0
output application/java
var quote = vars.createQuoteResponse[0]
---
p('sfdc.query.quote') ++ " where Id = '" ++ quote.id ++ "'"