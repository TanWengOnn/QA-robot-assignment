*** Settings ***
Library    SeleniumLibrary
Resource    ../resources/keywords-login.robot
    
*** Test Cases ***
Login To Deriv
    Login To Deriv Key

Validate Real Account 
    Validate Real Account Key

Navigate To Virtual Account
    Navigate To Virtual Account Key

Validate Virtual Account
    Click Element    dt_core_account-info_acc-info
    Click Element    dt_core_account-switcher_demo-tab
    Page Should Contain Element     //div[contains(@id,"dt_VR") and contains(@class, "--selected")]
    Close Browser

    
