%dw 2.0
output application/json
---
{
	"email": payload.Envelope.Body.GetQuote_v3.email,
	"password": payload.Envelope.Body.GetQuote_v3.password
}