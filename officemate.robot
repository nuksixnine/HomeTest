*** Settings ***
Library      Collections
Library      String
Library      RequestsLibrary
Library      OperatingSystem
Library      XML
Library      ./util.py
Library      ./vars.py
Library       SeleniumLibrary
Library       BuiltIn
Library       Dialogs
Library       openpyxl
Library       String
Library       ExcelLibrary
Library       Process
Library       DateTime
#Library       Readcolumn.py
Variables     vars.py
Resource      Keywords.robot
Resource      Variables.robot
Suite Setup               MainframeConfiguration
Test Setup                OPEN EXCEL XPATH

*** Test Cases ***
1. Get response officeMate
    Create Session                get_product         ${host}
    ${resp}=                      Get request          get_product    ${apitest}
    ${statusCode}                 Set Variable    ${resp.status_code}
    ${valueJson}                  Set Variable    ${resp.json()}
    log to console    ${valueJson}
    log to console    ${statusCode}

2.Automated UI officeMate    
     RUNSEARCH_PRODUCT
     
