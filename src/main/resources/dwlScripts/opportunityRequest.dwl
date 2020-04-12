%dw 2.0
output application/java
var days = p('sfdc.create.opportunity.closedays')
var recipientAddress = (vars.incomingPayload.shipToAddress1 default "") ++'\n'++ (vars.incomingPayload.shipToCity default "") ++'\n'++ (vars.incomingPayload.shipToState default "") ++'\n'++ (vars.incomingPayload.shipToCountry default "") ++'\n'++ (vars.incomingPayload.shipToPostalCode default "")
---
[
	{
		AccountId: p('sfdc.create.opportunity.accountid'),
		Name: p('sfdc.create.opportunity.name') ++ (vars.incomingPayload.shipToName default "") ++ " - " ++ (now() as String {format: "MMddyyyy"}) ,
		CloseDate: ((now() as Date) + ("P" ++ days ++"D") as Period) as Date,
		StageName: p('sfdc.create.opportunity.stagename'),
		ForecastCategoryName: p('sfdc.create.opportunity.forecastcategoryname'),
		Order_Type__c: p('sfdc.create.opportunity.order.type.c'),
		netsuite_conn__Order_Type__c: p('sfdc.create.opportunity.netsuite.conn.order.type.c'),
		Opportunity_Source__c: p('sfdc.create.opportunity.opportunity.source.c'),
		Type: p('sfdc.create.opportunity.type'),
		Recipient_Contact_Name__c: vars.incomingPayload.shipToContact default vars.incomingPayload.shipToName,
		Recipient_Contact_Phone__c:  vars.incomingPayload.shipToPhone,
		Recipient_Address__c:  if(sizeOf(recipientAddress) > 80) recipientAddress[0 to 254] else recipientAddress,
		Stage_Before_Closed__c: p('sfdc.create.opportunity.stage.before.closed.c')
	}
]
