*** Settings ***
Resource   ../resources/9 - directory/kw_directory.robot
Resource   ../resources/common.robot
Suite Setup      Open Left Menu    Directory
Suite Teardown   Close Browser

*** Test Cases ***
Test1: Directory - Find Profession Role
    Directory - Find Profession Role    Software Engineer

Test2: Directory - Find Location
    Directory - Find Location    Texas R&D