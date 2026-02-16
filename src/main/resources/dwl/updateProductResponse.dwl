%dw 2.0
output application/json
---
if (payload.successful)
    {
        productId: vars.productId,
        successful: true,
        salesforceId: payload.id,
        message: "Product Updated Successfully"
    }
else
    {
        productId: vars.productId,
        successful: false,
        errorMessage:
            (payload.payload.errors[0].message)
            default payload.message
            default "Error while updating product"
    }
