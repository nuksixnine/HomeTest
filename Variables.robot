*** Settings ***
Library   SeleniumLibrary
Library   BuiltIn
Library   Dialogs
Library   openpyxl
Library   String
Library   ExcelLibrary
Library   OperatingSystem
Library   Process
Library   DateTime
Library      Collections
Library      String
Library      RequestsLibrary
Library      OperatingSystem
Library      XML
Library      ./util.py
Library      ./vars.py


*** Variable ***

${excelLib}      ${EXECDIR}\\Data\\MainframeConfiguration.xlsx
${excelXPATH}    ${EXECDIR}\\Data\\Config_Xpath.xlsx
${suiteName}    Set Variable      ${SUITE NAME.rsplit('.')[0]}
${url}    https://www.officemate.co.th/en
${Browser}   chrome