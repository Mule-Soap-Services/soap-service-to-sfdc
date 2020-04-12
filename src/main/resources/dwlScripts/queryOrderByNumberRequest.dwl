%dw 2.0
output application/java
---
p('sfdc.query.shipment') ++ " where Order__r.OrderNumber = '" ++ vars.orderNumber ++ "'"