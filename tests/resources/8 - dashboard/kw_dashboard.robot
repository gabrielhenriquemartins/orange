*** Settings ***
Resource   ../../common/variable_and_library/common.robot

*** Keywords ***
Check If Dashboard ${dashboard_name} exists
    Get Element States    //*[@class="oxd-text oxd-text--p" and text()="${dashboard_name}"]     validate    value & visible    