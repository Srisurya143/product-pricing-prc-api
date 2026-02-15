%dw 2.0
output application/json
---
{
  "productId": vars.productId,
  "successful": payload.'successful',
  "salesforceId": payload.items.id[0],
  "message": "Poduct Deleted Successfully"
}