%dw 2.0
var exchangeRates = vars.exchangeRates.'rates'
var requestedCurrency = vars.currencyCode

fun currencyConversion(productPrice, fromCurrency, requestedCurrency)=
(	
 if(requestedCurrency ~= fromCurrency) //both request currency and existing currency are same
    ((productPrice) as String {format: "0.00"}) as Number
 else if(requestedCurrency ~= "USD") //anything to base currency
    ((productPrice / exchangeRates[fromCurrency]) as String {format: "0.00"}) as Number
 else if(fromCurrency ~= "USD") //base currency to anything
    ((productPrice * exchangeRates[requestedCurrency]) as String {format: "0.00"}) as Number
 else  //anything to anything via base currency
 (((productPrice / exchangeRates[fromCurrency]) * exchangeRates[requestedCurrency]) as String {format: "0.00"}) as Number
)
output application/json
---
payload map ((item, index) -> item  update {
    case .productPrice -> currencyConversion(item.productPrice, item.currencyCode, requestedCurrency)
    case .currencyCode -> requestedCurrency
} )
