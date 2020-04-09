
%dw 2.0
output application/xml
---
{
    GetQuote_v3Response: {
         GetQuote_v3Result: {
            "QuoteNumber": payload[0].QuoteNumber,
            "QuoteSubtotal": payload[0].Subtotal,
            "CarrierCode": vars.incomingPayload.carrierCode,
            "SvcSaturday": vars.incomingPayload.svcSaturday,
            "SvcInsurance": vars.incomingPayload.svcInsurance,
            "SvcHoldAtLoc": vars.incomingPayload.svcHoldAtLoc,
            "SvcInside": vars.incomingPayload.svcInside,
            "SvcLiftgate": vars.incomingPayload.svcLiftgate,
            "SvcPod": vars.incomingPayload.svcPod,
            "SvcPodAdult": vars.incomingPayload.svcPodAdult,
            "freightType": vars.incomingPayload.freightType,
            "freightAccountNo": vars.incomingPayload.freightAccountNo,
            "Freight": vars.incomingPayload.Freight default "",
            "QuoteTotal": payload[0].GrandTotal
            },
            OrderedLines: {
	            OrderedLineV2: vars.quotelineItemsResponse map {
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