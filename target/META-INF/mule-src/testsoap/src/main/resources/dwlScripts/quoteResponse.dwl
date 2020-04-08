%dw 2.0
output application/xml
---
{
	GetQuote_v3Response: {
		 GetQuote_v3Result: payload[0]
}}