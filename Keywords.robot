*** Settings ***
Resource      Variables.robot


*** Keywords ***
MainframeConfiguration
   #create excel    ${EXECDIR}\\Data\\testexcel.xlsx
   ${COLUMN_DATA_EXCEL}=    CHECK NAME
   Set Global Variable  ${COLUMN_DATA_EXCEL}  
   Log To Console   \nTESTCell=${COLUMN_DATA_EXCEL}


CHECK NAME
  
   Open Excel Document   filename=${excelLib}   doc_id=MainCofiguration
   ${getSheetExcel} =   get list sheet names      
   ${excelRow}   Count row    @{getSheetExcel}
   ${excelColumn}   Count column     @{getSheetExcel}
   FOR    ${Indexrow}   IN RANGE  2   ${excelRow}+1
       ${cellRow}   read excel row    row_num=${Indexrow}
       Run Keyword If    '${cellRow}[0]' == '${suiteName}'    Return From Keyword    ${cellRow}   
       Exit For Loop If    '${cellRow}[0]' == '${suiteName}'
   END      
   Close All Excel Documents      


RUNSEARCH_PRODUCT
    OPEN WEB SITE
    Maximize Browser Window
    ${TEST_DATA}=    Convert To String    ${COLUMN_DATA_EXCEL}[1]
    Open Excel Document   filename=${TEST_DATA}  doc_id=INPUT  
    ${excelRow}   Count row    INPUT 
    Wait Until Element Is Visible    ${ClickSearch}
    CLICK_SEARCH    ${ClickSearch}
    FOR   ${Indexrow}   IN RANGE  2   ${excelRow}+1
            ${DATAINPUT}   read excel row    row_num=${Indexrow}    sheet_name=INPUT
            Set Global Variable    ${Indexrow}
            Set Global Variable    ${DATAINPUT}
            Log To Console    ${DATAINPUT}
            INPUT SEARCH PRODUCT    ${ClickSearch}    ${DATAINPUT}
            SEARCH PRODUCT    ${ClickSearchProduct}
            Wait Until Element Is Visible    ${Wait_Add_to_cart}
            CLICK_SEARCH    ${Click_Clear_Value}
            Sleep     2.5
            Clear Element Text    ${Clear_Text}
    END

OPEN WEB SITE
     Open Browser   ${url}   ${Browser}

CLICK_SEARCH
     [Arguments]    ${XPATH}
     CLICK ELEMENT    xpath=${XPATH}

INPUT SEARCH PRODUCT
    [Arguments]    ${XPATH}    ${DATA_USER}
     Log To Console    ${DATA_USER}[0]
     INPUT TEXT    xpath=${XPATH}    ${DATA_USER}[0]

SEARCH PRODUCT
    [Arguments]    ${XPATH}   
     CLICK ELEMENT    xpath=${XPATH}

OPEN EXCEL XPATH
     ${wb}      Load Workbook    ${excelXPATH}
     ${ws}    Set Variable    ${wb.get_sheet_by_name('XPATH_SSC')}
     ${ClickSearch}    Set Variable    ${ws.cell(1,1).value}
     ${ClickSearchProduct}    Set Variable    ${ws.cell(2,1).value}
     ${Click_Clear_Value}    Set Variable    ${ws.cell(3,1).value}
     ${Wait_Add_to_cart}    Set Variable    ${ws.cell(4,1).value}
     ${Clear_Text}    Set Variable    ${ws.cell(5,1).value}   

     Set Global Variable    ${ClickSearch}
     Set Global Variable    ${ClickSearchProduct}
     Set Global Variable    ${Click_Clear_Value}
     Set Global Variable    ${Wait_Add_to_cart}
     Set Global Variable    ${Clear_Text}


