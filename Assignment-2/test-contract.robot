*** Settings ***
Library  SeleniumLibrary
Resource    ../resources/keywords-login.robot
Resource    ../resources/keywords-contract-config.robot

*** Variables ***
${purchase_amount}    10.00
${purchase_action}    Rise
${market_type}    Volatility 10 (1s) Index

*** Test Cases ***
Login To Deriv
    Login To Deriv Key

Validate Real Account 
    Validate Real Account Key

Navigate To Virtual Account
    Navigate To Virtual Account Key    

Navigate To Volatility 10 
    Open Market Type Dropdown
    Click Element    //div[contains(@class,'--1HZ10V')] 

Change Trade Type
    Open Trade Type Dropdown
    Click Element    dt_contract_rise_fall_item

Change To Ticks
    Click Element    dc_t_toggle_item

Change Duration Type
    Close Pop Up Key
    Open Duration Type Dropdown
    Click Element    //div[@data-testid="dti_list_item" and @id='t']

Change To Stake
    Click Button    dc_stake_toggle_item

Change Stake to 10 USD
    Press Keys    //input[@id='dt_amount_input']    CTRL+a+DELETE
    Input Text    //input[@id='dt_amount_input']    ${purchase_amount}     

Buy Volatility 10(1s) Index Rise
    Buy Contract

Validate Purchase 
    Validate Purchase Key    ${market_type}    ${purchase_action}    ${purchase_amount}
    Close Browser