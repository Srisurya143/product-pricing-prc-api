%dw 2.0
output application/json
---
{
      "message": "OK",
      "reason": "health check",
      "response": {
        "application": "currency-exchange-api",
        "buildVersion": "1.0.0",
        "buildTimeStamp": "2026-02-17T11:10:02.4522352+05:30",
        "code": "OK",
        "failed": false,
        "host": "localhost:8082",
        "tier": "local",
        "systems": [
          {
            "code": "OK",
            "message": "currency exchange api is reachable",
            "name": "currency exchange api"
          }
        ]
      },
      "status": 200
}