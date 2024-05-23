*** Settings ***
Resource   ../resources/0 - login/kw_login.robot
Suite Setup      Wait Until Keyword Succeeds    5x    2s     Open Orange Home Page

*** Test Cases ***
Test1: Check Invalid Credentials
    Invalid Login

Test2: Check Required Username Message
    Username Required

Test3: Check Required Password Message
    Password Required

Test4: Check Required Username and Password Message
    Username and Password Required

Test5: Check Official Orange Home Page
    Check Orange HRM link

Test6: Check Forgot Password and Email Message Sent
    Check Forgot Password

Test7: Login as Admin
    Login With the User Admin