%dw 2.0
output application/java
---
p('sfdc.query.account') ++ " where Id = '" ++ vars.accountId ++ "'"