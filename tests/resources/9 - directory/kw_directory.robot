*** Settings ***
Resource   ../../common/variable_and_library/common.robot

*** Keywords ***
Directory - Find Profession Role
    [Arguments]    ${profession}
    Click     (//*[@class="oxd-select-text oxd-select-text--active"])[1]
    Click    //*[@class="oxd-select-option"]//*[contains(text(), '${profession}')]
    Click    ${bt_submit}

Directory - Find Location
    [Arguments]    ${location}
    Click     (//*[@class="oxd-select-text oxd-select-text--active"])[2]
    Click    //*[@class="oxd-select-option"]//*[contains(text(), '${location}')]
    Click    ${bt_submit}