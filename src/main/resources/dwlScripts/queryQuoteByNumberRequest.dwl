%dw 2.0
output application/java
---
p('sfdc.query.quote') ++ " where QuoteNumber = '" ++ vars.quoteNumber ++ "'"