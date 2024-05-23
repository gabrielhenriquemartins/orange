*** Settings ***
Library    Browser     auto_closing_level=MANUAL     timeout=0:00:20
Library    FakerLibrary
Library    String
Library    Process
Library    OperatingSystem
Library    ../date_helper.py    WITH NAME    DateHelper

*** Variables ***
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
