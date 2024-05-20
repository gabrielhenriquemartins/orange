*** Settings ***
Library    Browser
Library    FakerLibrary
Library    String
Library    Process
Library    OperatingSystem
Library    ../common/date_helper.py    WITH NAME    DateHelper
Suite Setup      Open Orange Home Page
Suite Teardown   Close Browser

*** Variables ***
${TESTE}     GABRIEL
${username}      input[name="username"]
${password}      input[name="password"]
${bt_submit}     button[type="submit"]
${invalid_credential_field}     //*[@class="oxd-text oxd-text--p oxd-alert-content-text"]
${invalid_credential_msg}       Invalid credentials
${username_required}            (//*[@class="oxd-input-group oxd-input-field-bottom-space"])[1]//*[@class="oxd-text oxd-text--span oxd-input-field-error-message oxd-input-group__message"]
${password_required}            (//*[@class="oxd-input-group oxd-input-field-bottom-space"])[2]//*[@class="oxd-text oxd-text--span oxd-input-field-error-message oxd-input-group__message"]
${required_msg}                 Required

${orange_link}       //*[@href="http://www.orangehrm.com"]

${forgot_password}      //*[@class="oxd-text oxd-text--p orangehrm-login-forgot-header"]
${reset_password}       //*[@class="oxd-text oxd-text--h6 orangehrm-forgot-password-title"]
${reset_password_msg}   Reset Password

${reset_password_1}     (//*[@class="oxd-text oxd-text--p"])[1]
${reset_password_2}     (//*[@class="oxd-text oxd-text--p"])[2]
${reset_password_3}     (//*[@class="oxd-text oxd-text--p"])[3]
${reset_password_msg_1}     A reset password link has been sent to you via email.
${reset_password_msg_2}     You can follow that link and select a new password.
${reset_password_msg_3}     If the email does not arrive, please contact your OrangeHRM Administrator.

${profile_photo}     //*[@class="oxd-userdropdown-img"]

${ADMIN_USERNAME}    Admin
${ADMIN_PASSWORD}    admin123
${VIDEO_DIR}    /opt/robotframework/results/

*** Test Cases ***
Test: Check Invalid Credentials
    Invalid Login

Test: Check Required Username Message
    Username Required

Test: Check Required Password Message
    Password Required

Test: Check Required Username and Password Message
    Username and Password Required

Test: Check Official Orange Home Page
    Check Orange HRM link

Test: Check Forgot Password and Email Message Sent
    Check Forgot Password

Test: Login as Admin
    Login With the User Admin

*** Keywords ***
Open Orange Home Page
    ${current_date}=    Get Current Date
    New Browser    chromium    headless=Yes
    New Context    recordVideo={'dir': '${VIDEO_DIR}${current_date}'}
    New Page    https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
    Get Title    ==    OrangeHRM
    

Invalid Login
    Reload
    ${random_username}     Generate Random String     length=8
    ${random_password}     Generate Random String     length=8
    Fill Text    ${username}    ${random_username}
    Fill Text    ${password}    ${random_password}
    Click    ${bt_submit}
    ${msg}   Get Text    ${invalid_credential_field}
    Should Be Equal As Strings    ${msg}    ${invalid_credential_msg}

Password Required
    Reload
    ${random_username}     Generate Random String     length=8
    Fill Text    ${username}    ${random_username}
    Click    ${bt_submit}
    ${msg}   Get Text    ${password_required}
    Should Be Equal As Strings    ${msg}    ${required_msg}

Username Required
    Reload
    ${random_password}     Generate Random String     length=8
    Fill Text    ${password}    ${random_password}
    Click    ${bt_submit}
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
    Go To    https://opensource-demo.orangehrmlive.com/web/index.php/auth/login

Login With the User Admin
    Reload
    Fill Text    ${username}    ${ADMIN_USERNAME}
    Fill Text    ${password}    ${ADMIN_PASSWORD}
    Click    ${bt_submit}
    Get Element    ${profile_photo}