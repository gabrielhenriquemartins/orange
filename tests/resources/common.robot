*** Settings ***
Resource   ../common/variable_and_library/common.robot

*** Keywords ***
Open Left Menu
    [Arguments]    ${menu}
    Click    //span[@class='oxd-text oxd-text--span oxd-main-menu-item--name' and text()='${menu}']

Check Toast Message
    [Arguments]   ${message}
    Get Element States    //*[@class="oxd-text oxd-text--p oxd-text--toast-message oxd-toast-content-text" and text()='${message}']