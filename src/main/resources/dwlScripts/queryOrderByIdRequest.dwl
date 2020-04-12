%dw 2.0
output application/java
var order = vars.orderCreateResponse[0]
---
p('sfdc.query.order') ++ " where Id = '" ++ order.id ++ "'"