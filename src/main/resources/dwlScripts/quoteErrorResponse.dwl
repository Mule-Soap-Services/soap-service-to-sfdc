%dw 2.0
output application/xml skipNullOn="true"
ns soap http://schemas.xmlsoap.org/soap/envelope
var order = vars.queryOrderResponse[0]
---
{
    //body: {
        soap#GetQuote_v3Response: {
        	GetQuote_v3Result: {
        		QuoteNumber: null,
        		OrderedLines: null,
        		Error: {
        			ErrorNumber: 1,
        			ErrorDescription: error.description
        		}
        	}
        }
   // } //write "application/xml"
}