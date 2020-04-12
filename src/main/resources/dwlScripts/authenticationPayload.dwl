%dw 2.0
output application/java
---
{
	email: payload.Envelope.Body[0].email,
	password: payload.Envelope.Body[0].password
}