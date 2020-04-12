%dw 2.0
output application/xml skipNullOn="true"
ns soap http://schemas.xmlsoap.org/soap/envelope
var order = vars.queryOrderResponse[0]
---
{
    //body: {
        soap#EnterOrder_v5Response: {
        	EnterOrder_v5Result: {
        		OrderNumber: null,
        		backorderedItems: null,
        		Error: {
        			ErrorNumber: 1,
        			ErrorDescription: error.description
        		}
        	}
        }
   // } //write "application/xml"
}