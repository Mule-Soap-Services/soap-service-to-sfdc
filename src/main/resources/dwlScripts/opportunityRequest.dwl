%dw 2.0
output application/java
var days = p('sfdc.create.opportunity.closedays')
var recipientAddress = vars.incomingQuotePayload.shipToAddress1 ++'\n'++ vars.incomingQuotePayload.shipToCity ++'\n'++ vars.incomingQuotePayload.shipToState ++'\n'++ vars.incomingQuotePayload.shipToCountry ++'\n'++ vars.incomingQuotePayload.shipToPostalCode
---
[
{
AccountId: p('sfdc.create.opportunity.accountid'),
Name: p('sfdc.create.opportunity.name') ++ vars.incomingQuotePayload.shipToName ++ (now() as String {format: "MMddyyyyHHMM"}) ,
CloseDate: (now() as Date) + ("P" ++ days ++"D") as Period,
StageName: p('sfdc.create.opportunity.stagename'),
ForecastCategoryName: p('sfdc.create.opportunity.forecastcategoryname'),
Order_Type__c: p('sfdc.create.opportunity.order.type.c'),
netsuite_conn__Order_Type__c: p('sfdc.create.opportunity.netsuite.conn.order.type.c'),
Opportunity_Source__c: p('sfdc.create.opportunity.opportunity.source.c'),
Type: p('sfdc.create.opportunity.type'),
Recipient_Contact_Name__c: vars.incomingQuotePayload.shipToName,
Recipient_Contact_Phone__c:  vars.incomingQuotePayload.shipToPhone,
Recipient_Address__c: if(sizeOf(recipientAddress) > 80) recipientAddress[0 to 254] else recipientAddress,
Stage_Before_Closed__c: p('sfdc.create.opportunity.stage.before.closed.c')
}
]
