%dw 2.0
output application/json
---
{
    application: "currency exchange api health check for env " ++ p('mule.env'),
    message: "currency exchange api is not reachable",
    error: (error.detailedDescription default "Unknown error"),
    code: "ERROR"
}
