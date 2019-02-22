*** Settings ***

Library                                    SeleniumLibrary
Library                                    BuiltIn
Variables                                  ../Variables/variables.py
Variables                                  ../locators/locators.py

*** Keywords ***
Launch Browser
                                           Open Browser                   url=${localUrl}          browser= chrome
                                           Maximize Browser Window
                                           # Click Element                ${disclaimer}
                                           # Sleep                        3


Click on disclaimer button
                                           Click Element                  ${disclaimer}
                                           Sleep                          3



VerifyLeasingCalculatorFields
                                           Page Should Contain            ${text}
                                           Page Should Contain Element    ${headerName}
                                           SelFrame
                                           Page Should Contain Element    ${purchaseValueLabel}
                                           Click Element                  ${leasingDropDown}
                                           Page Should Contain Element    ${financialOption}
                                           Page Should Contain Element    ${operatingOption}
                                           Page Should Contain Button     ${calculatebutton}


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


Verify incorrrect Leasing financeamount

                                           Click Element                  ${purchaseValuefield}
                                           Clear Element Text             ${purchaseValuefield}
                                           Sleep                          3
                                           Input Text                     ${purchaseValuefield}    8000
                                           Sleep                          3
                                           Click Element                  ${calculatebutton}


SelFrame

                                           Select Frame                   ${iFrame}


ErrorMessage

                                           Page Should Contain Element    ${message}
