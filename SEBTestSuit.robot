*** Settings ***
Documentation                         Verify seb Leasing Calculator
Library                               SeleniumLibrary
Suite Setup                           launch Browser
Test Setup                            Log                                        Test Setup Started
Test Teardown                         Log                                        Test setUp completed
Suite Teardown                        Close All Browsers
Resource                              Keywords/Keywords.robot


*** Test Cases ***

SC001:Verif Page Fields
                                      [Documentation]                            This will verify the page field
                                      Click on disclaimer button
                                      VerifyLeasingCalculatorFields
                                      Log To Console                             Fields are present



 SC002:Verify for Type ofLeasing
                                      [Documentation]                            This will verify for lease amount, monthly payment, commission fee etc...

                                      VerifyLeasing finance amount
                                      Log To Console                             Displayed Instalment amount, annual interest, monthly payment are correct


SC003: Verify for incorrect amount
                                      [Documentation]                            This will verify for amount lower than 9000

                                      SelFrame
                                      Verify incorrrect Leasing financeamount
                                      ErrorMessage
                                      Set Test Message                           ${suggestion}


