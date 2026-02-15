%dw 2.0
output application/json
---
{
    application: "product pricing sys api health check for env " ++ p('mule.env'),
    message: "product pricing sys api is not reachable",
    error: (error.detailedDescription default "Unknown error"),
    code: "ERROR"
}
