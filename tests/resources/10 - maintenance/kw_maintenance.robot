*** Settings ***
Resource   ../../common/variable_and_library/common.robot
Resource   ../common.robot



*** Keywords ***
Candidate Records
    [Arguments]    ${profession}
    Maintenance Password
    Click     ${purge_records}
    Click     ${candidate_records}
    Fill Text     ${type_hints}    Software Engineer
    Click     //*[@class="oxd-autocomplete-option"]//*[contains(text(), '${profession}')]
    Click     ${bt_submit}
    Click     ${purge_all}
    Click     ${warning_alert}
    Check Toast Message    Successfully Purged

Maintenance Password
    Fill Text    ${password}    admin123
    Click    ${bt_submit}
