%dw 2.0
output application/json
---
payload.items map (item) ->
    if (item.successful)
        {
            successful: true,
            salesforceId: item.id,
            message: "Product Created Successfully"
        }
    else
        {
            successful: false,
            errorMessage: item.payload.errors[0].message default item.message default "Unknown Error"
        }
