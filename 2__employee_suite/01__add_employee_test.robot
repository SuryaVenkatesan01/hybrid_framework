*** Settings ***
Documentation       This file contains test cases for add valid emplooyee
...     records

Resource    ../resource/base/common_functionalities.resource

Library     DataDriver      file=../test_data/orange_data.xlsx      sheet_name=AddValidEmployeeTest

Test Setup      Launch Browser And Navigate To Url
Test Teardown    Close Browser
Test Template    Add Valid Employee Template
*** Test Cases ***

Add Valid Employee Test_${test_name}

*** Keywords ***
Add Valid Employee Template
    [Arguments]   ${username}   ${password}  ${firstName}  ${middleName}   ${lastName}   ${expected_value1}   ${expected_value2}
    Input Text    name=username     ${username}
    Input Password    name=password    ${password}
    Click Element    xpath=//button[normalize-space()='Login']
    Click Element    xpath=//span[text()='PIM']
    Click Element    link=Add Employee
    Input Text    name=firstName    ${firstName}
    Input Text    name=middleName   ${middleName}
    Input Text    name=lastName     ${lastName}
    Click Element    xpath=//button[normalize-space()='Save']
    Sleep    5s
    Element Should Contain    xpath=//h6[contains(normalize-space(),'${firstName}')]    ${expected_value1}
    Element Attribute Value Should Be    xpath=//input[@name='firstName']   value   ${expected_value2}
    
