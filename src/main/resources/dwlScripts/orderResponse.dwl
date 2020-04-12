%dw 2.0
output application/xml skipNullOn="true"
ns soap http://schemas.xmlsoap.org/soap/envelope
var order = vars.queryOrderResponse[0]
---
{
    body: {
        soap#EnterOrder_v5Response: {
        	EnterOrder_v5Result: {
        		OrderNumber: order.OrderNumber,
        		backorderedItems: {
        			OrderItem: order.OrderItems map {
        				PartNo: $.Product2.ProductCode,
        				Quantity: $.Quantity as Number {format: '#'}
        			}
        		},
        		Error: {
        			ErrorNumber: 0,
        			ErrorDescription: null
        		}
        	}
        }
    } //write "application/xml"
}