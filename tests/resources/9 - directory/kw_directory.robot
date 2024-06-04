*** Settings ***
Resource   ../../common/variable_and_library/common.robot

*** Keywords ***
Directory - Find Profession Role
    [Arguments]    ${profession}
    Click     ${role_dropdown}
    Click     //*[@class="oxd-select-option"]//*[contains(text(), '${profession}')]
    Click     ${bt_submit}

Directory - Find Location
    [Arguments]    ${location}
    Click    ${location_dropdown}
    Click    //*[@class="oxd-select-option"]//*[contains(text(), '${location}')]
    Click    ${bt_submit}