%dw 2.0
output application/json
---
(payload map {

        "productId"    : $.ExternalId__c,
        "currencyCode" : $.CurrencyCode__c,
        "description"  : $.Description,
        "productName"  : $.Name,
        "productPrice" : $.ProductPrice__c,
        "productCode"  : $.ProductCode

}) filter ((item, index) -> !isEmpty(item.currencyCode) )