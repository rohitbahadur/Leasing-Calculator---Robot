*** Settings ***

Library                                      SeleniumLibrary
Library                                      BuiltIn
Variables                                    ../Variables/variables.py
Variables                                    ../locators/locators.py

*** Keywords ***
Launch Browser
                                             Open Browser                   url=${localUrl}          browser= chrome
                                             Maximize Browser Window
                                             # Click Element                ${disclaimer}
                                             # Sleep                        3


Click on disclaimer button
                                             Click Element                  ${disclaimer}
                                             Sleep                          3



PageTxt                                      Page Should Contain            ${text}
PageHeader                                   Page Should Contain Element    ${headerName}
PurchaseValue                                Page Should Contain Element    ${purchaseValueLabel}
ClickLeasing                                 Click Element                  ${leasingDropDown}
FinancialOption                              Page Should Contain Element    ${financialOption}
OperatingOption                              Page Should Contain Element    ${operatingOption}
CalculateButton                              Page Should Contain Button     ${calculatebutton}


VerifyLeasing finance amount



                                             Input Text                     ${purchaseValuefield}    9000
                                             Click Element                  ${leasingDropDown}
                                             Click Element                  ${financialOption}
                                             Click Element                  ${calculatebutton}
                                             Page Should Contain            ${instalmentamount}
                                             Page Should Contain            ${monthylpayment}
                                             Page Should Contain            ${commissionfee}
                                             Page Should Contain            ${firstInstalment}
                                             Page Should Contain            ${annualinterest}
                                             Page Should Contain            ${totalfiancingcost}
                                             SelFrame
                                             Click Element                  ${paymentsch}



# Verify incorrrect Leasing financeamount

ClickpurchaseValue                           Click Element                  ${purchaseValuefield}
ClearpurchaseValue                           Clear Element Text             ${purchaseValuefield}
slp                                          Sleep                          3
EnterInpurchaseValue                         Input Text                     ${purchaseValuefield}    8000

Clickcalculate                               Click Element                  ${calculatebutton}


SelFrame
                                             Select Frame                   ${iFrame}


ErrorMessage

                                             Page Should Contain Element    ${message}
