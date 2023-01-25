*** Settings ***
Documentation       This file contains test cases related to invalid login

Resource    ../resource/base/common_functionalities.resource

Library     DataDriver      file=../test_data/orange_data.xlsx      sheet_name=InvalidLoginTest

Test Setup      Launch Browser And Navigate To Url
Test Teardown    Close Browser
Test Template    Invalid Login Template

*** Test Cases ***
TC1

*** Keywords ***
Invalid Login Template
    [Arguments]     ${username}     ${password}     ${expected_error}
    Input Text    name=username    ${username}
    Input Password    name=password    ${password}
    Click Element    xpath=//button[normalize-space()='Login']
    Element Should Contain    xpath=//p[text()='Invalid credentials']    ${expected_error}
    Sleep    5s



