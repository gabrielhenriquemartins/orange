*** Settings ***
Resource   ../resources/12 - buzz/kw_buzz.robot
Resource   ../resources/common.robot
Suite Setup      Open Left Menu    Buzz


*** Test Cases ***
Test1: Buzz - Post a Message
    Write and Post    message=Hello There
Test2: Buzz - Check Published Message
    Check Published Message    message=Hello There
Test3: Buzz - Like a Message
    React to the first Message with a Heart




