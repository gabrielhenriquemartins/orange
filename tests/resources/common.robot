*** Settings ***
Resource   ../common/variable_and_library/common.robot

*** Keywords ***
Open Left Menu
    [Arguments]    ${menu}
    Click    //span[@class='oxd-text oxd-text--span oxd-main-menu-item--name' and text()='${menu}']
