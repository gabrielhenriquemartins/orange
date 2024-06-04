*** Settings ***
Resource   ../../common/variable_and_library/common.robot

*** Keywords ***
Open Orange Home Page
    Close Browser
    ${current_date}=    Get Current Date
    New Browser    chromium    headless=Yes  
    New Context    recordVideo={'dir': '${VIDEO_DIR}${current_date}'}
    Set Browser Timeout    60s
    New Page       ${URL}
    Get Title    ==    OrangeHRM
      

Invalid Login
    Reload
    ${random_username}     Generate Random String     length=8
    ${random_password}     Generate Random String     length=8
    Fill Text    ${username}    ${random_username}
    Fill Text    ${password}    ${random_password}
    Click    ${bt_submit}
    ${msg}   Get Text      ${invalid_credential_field}
    Should Be Equal As Strings    ${msg}    ${invalid_credential_msg}

Password Required
    Reload
    ${random_username}          Generate Random String     length=8
    Fill Text    ${username}    ${random_username}
    Click        ${bt_submit}
    ${msg}   Get Text           ${password_required}
    Should Be Equal As Strings  ${msg}    ${required_msg}

Username Required
    Reload
    ${random_password}     Generate Random String     length=8
    Fill Text    ${password}    ${random_password}
    Click        ${bt_submit}
    ${msg}   Get Text    ${username_required}
    Should Be Equal As Strings    ${msg}    ${required_msg}

Username and Password Required
    Reload
    Click    ${bt_submit}
    ${msg}   Get Text    ${username_required}
    Should Be Equal As Strings    ${msg}    ${required_msg}
    ${msg}   Get Text    ${password_required}
    Should Be Equal As Strings    ${msg}    ${required_msg}

Check Orange HRM link
    Reload
    Click     ${orange_link}
    Switch Page        NEW
    Get Title    ==    Human Resources Management Software | OrangeHRM   
    Close Page
    Get Title    ==    OrangeHRM

Check Forgot Password
    Reload
    Click     ${forgot_password}
    ${msg}    Get Text    ${reset_password}
    Should Be Equal As Strings    ${msg}    ${reset_password_msg}
    ${random_username}     Generate Random String     length=8
    Fill Text    ${username}    ${random_username}
    Click    ${bt_submit}
    ${msg}   Get Text    ${reset_password_1}
    Should Be Equal As Strings    ${msg}    ${reset_password_msg_1}
    ${msg}   Get Text    ${reset_password_2}
    Should Be Equal As Strings    ${msg}    ${reset_password_msg_2}
    ${msg}   Get Text    ${reset_password_3}
    Should Be Equal As Strings    ${msg}    ${reset_password_msg_3}
    Go To    ${URL}

Login With the User Admin
    Reload
    Fill Text    ${username}    ${ADMIN_USERNAME}
    Fill Text    ${password}    ${ADMIN_PASSWORD}
    Click    ${bt_submit}
    Get Element    ${profile_photo}