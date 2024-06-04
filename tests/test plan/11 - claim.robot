*** Settings ***
Resource   ../resources/11 - claim/kw_claim.robot
Resource   ../resources/common.robot
Suite Setup    Open Left Menu   Claim

*** Test Cases ***
Test1: Claim - Create an Event
    Create an Event    Event Test
    Check Toast Message    Successfully Saved

Test2: Claim - Create an Expense Type
    Create an Expense Type    Expense Test

Test3: Claim - Submit Claim
    Submit Claim   Event Test    Canadian Dollar
    Check Toast Message    Successfully Saved

Test4: Claim - Add Expenses
    Add Expenses    Transport    20
    Check Toast Message    Successfully Saved
    Verify Added Expense    Transport

Test5: Claim - Add PDF File
    Add PDF File
    Check Toast Message    Successfully Saved
    Verify Pdf Uploaded    pdf_test.pdf
    
    