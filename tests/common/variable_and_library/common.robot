*** Settings ***
Library    Browser     auto_closing_level=MANUAL     timeout=0:00:20
Library    FakerLibrary
Library    String
Library    Process
Library    OperatingSystem
Library    ../date_helper.py    WITH NAME    DateHelper

*** Variables ***
${URL}           https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${orange_link}   //*[@href="http://www.orangehrm.com"]

${username}      input[name="username"]
${password}      input[name="password"]
${bt_submit}     button[type="submit"]
${tx_area}       textarea[placeholder="What's on your mind?"]

${invalid_credential_field}     //*[@class="oxd-text oxd-text--p oxd-alert-content-text"]
${invalid_credential_msg}       Invalid credentials
${username_required}            (//*[@class="oxd-input-group oxd-input-field-bottom-space"])[1]//*[@class="oxd-text oxd-text--span oxd-input-field-error-message oxd-input-group__message"]
${password_required}            (//*[@class="oxd-input-group oxd-input-field-bottom-space"])[2]//*[@class="oxd-text oxd-text--span oxd-input-field-error-message oxd-input-group__message"]
${required_msg}                 Required
${role_dropdown}                (//*[@class="oxd-select-text oxd-select-text--active"])[1]
${location_dropdown}            (//*[@class="oxd-select-text oxd-select-text--active"])[2]
${purge_records}                //*[@class="oxd-topbar-body-nav-tab-item"][contains(text(), 'Purge Records ')]
${candidate_records}            //*[@role="menuitem"][contains(text(),'Candidate Records')]
${type_hints}                   input[placeholder="Type for hints..."]
${purge_all}                    //*[@class="oxd-button oxd-button--medium oxd-button--secondary" and text()=' Purge All ']
${warning_alert}                //*[@class="oxd-button oxd-button--medium oxd-button--label-danger orangehrm-button-margin"]
${without_likes}                (//*[@class="oxd-text oxd-text--p"])[1]
${with_likes}                   (//*[@class="oxd-text oxd-text--p orangehrm-buzz-stats-active"])[1]

${forgot_password}      //*[@class="oxd-text oxd-text--p orangehrm-login-forgot-header"]
${reset_password}       //*[@class="oxd-text oxd-text--h6 orangehrm-forgot-password-title"]
${reset_password_msg}   Reset Password
${heart_button}         (//*[@id="heart-svg"])[1]  

${reset_password_1}     (//*[@class="oxd-text oxd-text--p"])[1]
${reset_password_2}     (//*[@class="oxd-text oxd-text--p"])[2]
${reset_password_3}     (//*[@class="oxd-text oxd-text--p"])[3]
${reset_password_msg_1}     A reset password link has been sent to you via email.
${reset_password_msg_2}     You can follow that link and select a new password.
${reset_password_msg_3}     If the email does not arrive, please contact your OrangeHRM Administrator.

${button_configuration}    //*[@class="oxd-topbar-body-nav-tab-item"][contains(text(), 'Configuration')]
${button_events}           //*[@class="oxd-topbar-body-nav-tab-link"][contains(text(), 'Events')]
${button_expense}          //*[@class="oxd-topbar-body-nav-tab-link"][contains(text(), 'Expense Types')]
${button_add}              //*[@type="button" and text()=' Add ']
${field_text}              (//*[@class="oxd-input oxd-input--active"])[2]
${description}             //*[@class="oxd-textarea oxd-textarea--active oxd-textarea--resize-vertical"]

${button_submit_claim}    //*[@class="oxd-topbar-body-nav-tab-item"][contains(text(), 'Submit Claim')]
${event}                  (//*[@class="oxd-select-text-input"])[1]
${currency}               (//*[@class="oxd-select-text-input"])[2]

${button_add_1}    (//*[@class="oxd-button oxd-button--medium oxd-button--text" and text()=' Add '])[1]
${input_text}      //*[@class="oxd-select-text-input"]
${date}            //*[@class="oxd-icon bi-calendar oxd-date-input-icon"]
${today_date}      //*[@class="oxd-calendar-date --selected --today"]
${field_expense}   //*[@class="oxd-sheet oxd-sheet--rounded oxd-sheet--white oxd-dialog-sheet oxd-dialog-sheet--shadow oxd-dialog-sheet--gutters"]//*[@class="oxd-input oxd-input--active"]
${upload_button}   //*[@class="oxd-icon bi-upload oxd-file-input-icon"]
${button_add_2}    (//*[@class="oxd-button oxd-button--medium oxd-button--text" and text()=' Add '])[2]
${profile_photo}   //*[@class="oxd-userdropdown-img"]

${ADMIN_USERNAME}    Admin
${ADMIN_PASSWORD}    admin123
${VIDEO_DIR}    /opt/robotframework/results/


#setTimeout(() => { debugger }, 6000)