%dw 2.0
output application/java
var days = p('sfdc.create.opportunity.closedays')
---
[
{
AccountId: p('sfdc.create.opportunity.accountid'),
Name: p('sfdc.create.opportunity.name') ++ vars.incomingPayload.shipToName ++ (now() as String {format: "MMddyyyyHHMM"}) ,
CloseDate: (now() as Date) + ("P" ++ days ++"D") as Period,
StageName: p('sfdc.create.opportunity.stagename'),
ForecastCategoryName: p('sfdc.create.opportunity.forecastcategoryname'),
Order_Type__c: p('sfdc.create.opportunity.order.type.c'),
netsuite_conn__Order_Type__c: p('sfdc.create.opportunity.netsuite.conn.order.type.c'),
Opportunity_Source__c: p('sfdc.create.opportunity.opportunity.source.c'),
Type: p('sfdc.create.opportunity.type'),
Recipient_Contact_Name__c: vars.incomingPayload.shipToName,
Recipient_Contact_Phone__c:  vars.incomingPayload.shipToPhone,
//Recipient_Address__c: vars.incomingPayload.shipToAddress1 ++'\n'++ vars.incomingPayload.shipToCity ++'\n'++ vars.incomingPayload.shipToState ++'\n'++ vars.incomingPayload.shipToCountry ++'\n'++ vars.incomingPayload.shipToPostalCode,
Recipient_Address__c: "chennai",
Stage_Before_Closed__c: p('sfdc.create.opportunity.stage.before.closed.c')
}
]
