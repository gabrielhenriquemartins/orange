*** Settings ***
Resource   ../resources/8 - dashboard/kw_dashboard.robot
Suite Setup      Get Element    ${profile_photo}
Suite Teardown   Close Browser

*** Test Cases ***
Test1: Dashboard - Check If the main seven dashboards exists
    Check If Dashboard Time at Work exists
    Check If Dashboard My Actions exists
    Check If Dashboard Quick Launch exists
    Check If Dashboard Buzz Latest Posts exists
    Check If Dashboard Employees on Leave Today exists
    Check If Dashboard Employee Distribution by Sub Unit exists
    Check If Dashboard Employee Distribution by Location exists