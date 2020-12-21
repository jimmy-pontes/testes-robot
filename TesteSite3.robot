*** Settings ***

Library         SeleniumLibrary
Test Setup      Abrir navegador
Test Teardown   Fechar navegador

*** Variables ***

${URL}           http://automationpractice.com
${BROWSER}       chrome

*** Test Cases ***
Caso de Teste 03: Listar Produtos
    Acessar a página home do site
    Conferir se a página home foi exibida
    Passar o mouse por cima da categoria "Women" no menu principal superior de categorias
    Conferir se as sub-categorias foram exibidas
    Clicar na sub-categoria "Summer Dresses"
    Conferir se a página com os produtos da categoria selecionada foram exibidos

*** Keywords ***

Abrir navegador
    Open Browser    about:blank   ${BROWSER}

Fechar navegador
    Close Browser

## Caso de Teste 03: Listar Produtos
Acessar a página home do site
    Go To   http://automationpractice.com

Conferir se a página home foi exibida
    Title Should Be     My Store

Passar o mouse por cima da categoria "${CATEGORIA}" no menu principal superior de categorias
    Mouse Over      css=#block_top_menu > ul > li:nth-child(1) > a

Conferir se as sub-categorias foram exibidas
    Page Should Contain Link        xpath=//*[@id="block_top_menu"]/ul/li[1]/ul/li[1]/a
    Page Should Contain Link        xpath=//*[@id="block_top_menu"]/ul/li[1]/ul/li[2]/a
    Wait Until Element Is Visible   css=#category-thumbnail > div:nth-child(1) > img

Clicar na sub-categoria "Summer Dresses"
    Click Element       css=#block_top_menu > ul > li:nth-child(1) > ul > li:nth-child(2) > ul > li:nth-child(3) > a

Conferir se a página com os produtos da categoria selecionada foram exibidos
    Wait Until Element Is Visible   css=#center_column > h1
    Wait Until Element Is Visible   id=uniform-selectProductSort
    Title Should Be                 Summer Dresses - My Store