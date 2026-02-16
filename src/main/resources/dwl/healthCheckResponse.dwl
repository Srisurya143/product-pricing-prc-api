%dw 2.0
var healthCheckPayload = (payload pluck ((value, key, index) -> value ))..response.systems
output application/json
---
{
    "message": "OK",
    "reason": "health check",
    "response": {
        "application": p('api.Name'),
        "buildVersion": p('api.Version'),
        "buildTimeStamp": now(),
        "code": if(healthCheckPayload.code contains "ERROR") "ERROR" else "OK",
        "failed": if(healthCheckPayload.code contains "ERROR") true else false,
        "host": vars.host,
        "tier": p('mule.env') default "",
        "systems": if (!isEmpty(healthCheckPayload)) flatten(healthCheckPayload) else []
    },
    "status": 200
}
