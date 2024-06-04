*** Settings ***
Resource   ../resources/10 - maintenance/kw_maintenance.robot
Resource   ../resources/common.robot
Suite Setup    Open Left Menu   Maintenance

*** Test Cases ***
Test1: Maintenance - Candidate Records
    Candidate Records    Software Engineer