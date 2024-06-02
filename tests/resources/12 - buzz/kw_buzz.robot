*** Settings ***
Resource   ../../common/variable_and_library/common.robot

*** Keywords ***
Write and Post
    [Arguments]    ${message}
    Click    ${tx_area}
    Fill Text    ${tx_area}    ${message}
    Click    ${bt_submit}
    
Check Published Message
    [Arguments]    ${message}
    Get Element States    //*[@class="oxd-text oxd-text--p orangehrm-buzz-post-body-text" and text()="${message}"]

React to the first Message with a Heart
    wait until keyword Succeeds   5x  2s   Get Text and Should be Equal    (//*[@class="oxd-text oxd-text--p"])[1]    0 Likes
    Click    (//*[@id="heart-svg"])[1]   
    wait until keyword Succeeds   5x  2s   Get Text and Should be Equal    (//*[@class="oxd-text oxd-text--p orangehrm-buzz-stats-active"])[1]    1 Like

Get Text and Should be Equal
    [Arguments]     ${selector}    ${message}
    ${text}    Get Text    ${selector}
    Should Be Equal As Strings    ${text}    ${message}
