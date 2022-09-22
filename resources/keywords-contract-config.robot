*** Settings ***
Library   SeleniumLibrary

*** Variables ***
${dt_contract_dropdown}    //div[@data-testid='dt_contract_dropdown']

*** Keywords ***

Close Pop Up Key
    ${pop_up_count}=    Get Element Count    //*[@class="notification__close-button"]
    
    IF  ${pop_up_count} != 0
        FOR  ${pop_up}  IN  ${pop_up_count}
            Click Element    //*[@class="notification__close-button"]
            Sleep    3
        END
    END

Open Market Type Dropdown
    Click Element    //div[@class="cq-symbol-select-btn"]
    Wait Until Page Contains Element    //div[@class='sc-mcd__filter__item sc-mcd__filter__item--selected']    30

Open Trade Type Dropdown
    Wait Until Page Contains Element    ${dt_contract_dropdown}   30
    Click Element     ${dt_contract_dropdown}  

Open Duration Type Dropdown
    Click Element    dt_simple_toggle
    Click Element    dc_duration_toggle_item
    Click Element    //div[@data-testid='dti_dropdown_display']
    Wait Until Page Contains Element    //div[@data-testid='dti_dropdown_display']    30  

Buy Contract
    Wait Until Page Does Not Contain Element    //button[@id='dt_purchase_call_button' and contains(@class,'--disabled')]    30
    Click Element    dt_purchase_call_button

Sell Contract
    Wait Until Page Does Not Contain Element    //button[@id='dt_purchase_put_button' and contains(@class,'--disabled')]    30 
    Click Element    dt_purchase_put_button
    
Validate Purchase Key
    [Arguments]    ${market_type}    ${purchase_action}    ${purchase_amount}
    Wait Until Element Is Visible    //div[contains(@id, 'dc_contract_card')]    30
    Page Should Contain Element    //div[@id='dc-contract_card_underlying_label' ]/span[text()='${market_type}']  
    Page Should Contain Element    //div[@class='dc-contract-type__type-label']/div[text()='${purchase_action}']
    Page Should Contain Element    //div[@class='dc-contract-card-item__body']/span[text()='${purchase_amount}']
