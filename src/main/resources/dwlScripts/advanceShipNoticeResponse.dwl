%dw 2.0
output application/xml skipNullOn="true"
ns soap http://schemas.xmlsoap.org/soap/envelope
var shipments = vars.queryShipmentResponse
---
{
   // body: {
        soap#AdvanceShipNoticeGet_v2Response: {
        	AdvanceShipNoticeGet_v2Result: {
        		AdvanceShipNotices: {
        			AdvanceShipNotice_v2:[
        				{
        					PONumber: shipments[0].Order__r.PoNumber,
        					OrderNumber: shipments[0].Order__r.OrderNumber,
        					OrderDate: shipments[0].Order__r.EffectiveDate,
        					DateShipped: shipments[0].Order__r.Date_Shipped__c,
        					CustomerCode: shipments[0].Order__r.Customer_Code__c,
        					BillingName: shipments[0].Order__r.Quote__r.BillingName,
        					ShipToName: shipments[0].Order__r.Quote__r.ShippingName,
        					ShipToAddress1: shipments[0].Order__r.ShippingAddress.street,
        					ShipToAddress2:null,
        					ShipToCity: shipments[0].Order__r.ShippingAddress.city,
        					ShipToState: shipments[0].Order__r.ShippingAddress.state,
        					ShipToZip: shipments[0].Order__r.ShippingAddress.postalCode,
        					ShipToCountry: shipments[0].Order__r.ShippingAddress.country,
        					ShipToContact: shipments[0].Order__r.Quote__r.ShipToContact__c,
        					ShipToPhone: shipments[0].Order__r.Quote__r.ShipToPhone__c,
        					ShippingInstructions: shipments[0].Order__r.Shipping_Instructions__c,
        					EndUserPONumber: shipments[0].Order__r.End_User_PoNumber__c,
        					ResellerAssignedCustomerId: shipments[0].Order__r.Reseller_Assigned_CustomerId__c,
        					StoreFrontOrderNo: shipments[0].Order__r.OrderNumber,
        					ShipToEmail: shipments[0].Order__r.Ship_To_Email__c,
        					ASNcartons: {
        						ASNcarton_v2: shipments map {
        							CartonNo: $.Carton_No__c,
        							ShipVia: $.Carrier__c,
        							TrackingNo: $.Tracking_Number__c,
        							DateShipped: $.Dispatch_Date__c,
        							ASNcartonDetails: {
        								ASNcartonDetail_v2:[
        									{
        										PartNumber: $.Order_Product__r.Product2.ProductCode,
        										OrderLineNumber: $.Order_Product__r.OrderItemNumber,
        										QtyShipped: $.Num_of_Ships__c,
        										SerialNumber: $.Serial_Number__c,
        										MACaddress: $.MAC_Address__c,
        										kitPartNo: $.Order_Product__r.Product2.ProductCode,
        										VendorCode: p('dten.vendor.code'),
        										Vendor: p('dten.vendor.name'),
        										UniqueLineId: $.Order_Product__r.OrderItemNumber,
        									}
        								]
        							}
        						}
    						}
    					}
        			]
        		},
        		Error: {
        			ErrorNumber: 0,
        			ErrorDescription: null
        		}
        	}
        }
   // } //write "application/xml"
}