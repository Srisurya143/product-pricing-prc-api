%dw 2.0
output application/json
---
payload.items map ((item, index) ->{
  "successful": item.successful,
  "salesforceId": item.'id',
  "message": "Product Created Successfully"
} )