*** Settings ***
Library   SeleniumLibrary

*** Variables ***
# XPATH Format 
${login_button}    //button[@id='dt_login_button']
${email_input}    //input[@type='email']
${loading_interface}    //*[@aria-label="Loading interface..."]

*** Keywords ***
Login To Deriv Key
    # Open chrome browser
    Open Browser    https://app.deriv.com/    chrome
    Maximize Browser Window  # Build in Keyword/Function
    Set Selenium Speed   0.05
    Wait Until Page Does Not Contain Element    ${loading_interface}     30
    Click Element    ${login_button} 
    Wait Until Page Contains Element    ${email_input}    30
    Input Text    ${email_input}    test@gmail.com
    Input Text    //input[@type='password']    Test@12345
    Click Element    //button[@type='submit']

Validate Real Account Key
    Wait Until Page Does Not Contain Element    ${loading_interface}     30
    Click Element    dt_core_account-info_acc-info
    Page Should Contain Element     //div[contains(@id,"dt_CR")]

Navigate To Virtual Account Key
    Click Element    dt_core_account-switcher_demo-tab
    Page Should Contain Element     //div[contains(@id,"dt_VR")]
    Click Element    //div[contains(@id,"dt_VR")]
    Wait Until Page Does Not Contain Element    ${loading_interface}     30
