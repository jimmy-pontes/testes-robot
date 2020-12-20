*** Settings ***

Library         SeleniumLibrary
Test Setup      Abrir navegador
Test Teardown   Fechar navegador

*** Variables ***

${URL}           http://automationpractice.com
${BROWSER}       chrome


*** Test Case ***
Caso de Teste 01: Pesquisar produtos existentes
    Acessar a página home do site
    Conferir se a página home foi exibida
    Digitar o nome do produto "Blouse" no campo de Pesquisa
    Clicar no botão Pesquisar
    Conferir se o produto "Blouse" foi listado no site


*** Keywords ***

Abrir navegador
    Open Browser    about:blank   ${BROWSER}

Fechar navegador
    Close Browser

## Caso de Teste 01: Pesquisar produtos existentes
Acessar a página home do site
    Go To   http://automationpractice.com

Conferir se a página home foi exibida
    Title Should Be     My Store

Digitar o nome do produto "${PRODUTO}" no campo de Pesquisa
    Input Text   name=search_query   ${PRODUTO}

Clicar no botão Pesquisar
    Click Element   name=submit_search

Conferir se o produto "${PRODUTO}" foi listado no site
    Wait Until Element Is Visible   css=#center_column > h1
    Title Should Be                 Search - My Store
    Page Should Contain Link        xpath=//*[@id="center_column"]//a[@class="product-name"][contains(text(),"Blouse")]

