%dw 2.0
output application/xml
---
{
    GetQuote_v3Response: {
         GetQuote_v3Result: {
            "QuoteNumber": payload[0].QuoteNumber,
            "QuoteSubtotal": payload[0].Subtotal,
            "CarrierCode": vars.incomingQuotePayload.carrierCode,
            "SvcSaturday": vars.incomingQuotePayload.svcSaturday,
            "SvcInsurance": vars.incomingQuotePayload.svcInsurance,
            "SvcHoldAtLoc": vars.incomingQuotePayload.svcHoldAtLoc,
            "SvcInside": vars.incomingQuotePayload.svcInside,
            "SvcLiftgate": vars.incomingQuotePayload.svcLiftgate,
            "SvcPod": vars.incomingQuotePayload.svcPod,
            "SvcPodAdult": vars.incomingQuotePayload.svcPodAdult,
            "freightType": vars.incomingQuotePayload.freightType,
            "freightAccountNo": vars.incomingQuotePayload.freightAccountNo,
            "Freight": vars.incomingQuotePayload.Freight default "",
            "QuoteTotal": payload[0].GrandTotal
            },
            OrderedLines: {
                OrderedLineV2: payload[0].QuoteLineItems map {
                UnitPrice: $.UnitPrice,
                Description: $.Description,
                TotalPrice: $.TotalPrice,
                'type': $."type",
                LineNumber: $.LineNumber
        
            },
            Error: {
                ErrorNumber: if(not isEmpty(vars.errorResponse.errorCode)) vars.errorResponse.errorCode else 0,
                ErrorDescription: if(not isEmpty(vars.errorResponse.errorMessage)) vars.errorResponse.errorMessage else ""
            }
        }
    }
}