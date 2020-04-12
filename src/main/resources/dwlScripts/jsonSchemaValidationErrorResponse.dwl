%dw 2.0
output application/json
---
{
    (vars.serviceName): {
				Error: {
					ErrorNumber: 1,
					ErrorDescription: "missing required fields " ++ ((error.muleMessage.typedValue.instance.*pointer) joinBy ",") ++ " in the request" 
				}
		}
}