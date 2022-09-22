*** Settings ***
Library  SeleniumLibrary
Resource    ../resources/keywords-login.robot
Resource    ../resources/keywords-contract-config.robot

*** Variables ***
${duration}    4
${purchase_amount}    15.50
${purchase_action}    Lower
${market_type}    AUD/JPY

*** Test Cases ***
Login To Deriv
    Login To Deriv Key

Validate Real Account 
    Validate Real Account Key

Navigate To Virtual Account
    Navigate To Virtual Account Key    

Navigate To Volatility 10 
    Open Market Type Dropdown
    Click Element    //div[contains(@class,'--frxAUDJPY')] 

Change Trade Type
    Open Trade Type Dropdown
    Click Element    dt_contract_high_low_item

Change Duration Type
    Click Element    //button[@id='dc_duration_toggle_item']

Change Duration Days
    Press Keys    //input[@class='dc-input__field']    CTRL+a+DELETE
    Input Text    //input[@class='dc-input__field']    ${duration}   

Change To Payout
    Click Button    dc_payout_toggle_item

Change Payout to 15.50 USD
    Press Keys    //input[@id='dt_amount_input']    CTRL+a+DELETE
    Input Text    //input[@id='dt_amount_input']    ${purchase_amount}     

Sell Higher/Lower
    Sell Contract    

Validate Purchase
    Validate Purchase Key    ${market_type}    ${purchase_action}    ${purchase_amount}
    Close Browser