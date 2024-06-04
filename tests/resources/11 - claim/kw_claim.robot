*** Settings ***
Resource   ../../common/variable_and_library/common.robot
Resource   ../common.robot

*** Keywords ***
Create an Event
    [Arguments]   ${event}
    click    ${button_configuration}
    click    ${button_events}
    click    ${button_add}
    Fill Text    ${field_text}     ${event}
    Fill Text    ${description}   Some description will be saved here!
    Click    ${bt_submit}

Create an Expense Type
    [Arguments]    ${expense}
    click    ${button_configuration}
    click    ${button_expense}
    click    ${button_add}
    Fill Text    ${field_text}     ${expense}
    Fill Text    ${description}   Some description will be saved here!
    Click    ${bt_submit}

Submit Claim
    [Arguments]    ${event}    ${currency}
    click    ${button_submit_claim}
    click    ${event}
    click    //*[@class="oxd-select-option"]//*[contains(text(), '${event}')]
    click    ${currency}
    click    //*[@class="oxd-select-option"]//*[contains(text(), '${currency}')]
    Click    ${bt_submit}

Add Expenses
    [Arguments]    ${expense}    ${amount}    
    Click   ${button_add_1}
    Click   ${input_text}
    Click   //*[@class="oxd-select-option"]//*[contains(text(), '${expense}')]
    Click   ${date}
    Click   ${today_date}
    Fill Text    ${field_expense}    ${amount}  
    Click    ${bt_submit}  

Add PDF File
    Click   
    ${promise}    Promise To Upload File       ${button_add_2}   /opt/robotframework/tests/common/files/pdf_test.pdf
    Click    ${upload_button}
    ${upload_result}=    Wait For    ${promise}
    Click    ${bt_submit}  

Verify Pdf Uploaded
    [Arguments]    ${pdf_name}
    Get Element States    //*[@class="oxd-text oxd-text--span" and text()='${pdf_name}']

Verify Added Expense
    [Arguments]    ${expense}
    Get Element States    //*[@class="oxd-table-card-cell"]//*[contains(text(), '${expense}')]