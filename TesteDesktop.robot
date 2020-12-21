*** Settings ***

Documentation     Manipulando o Bloco de Notas usando robotframework e SikulyLibrary
Library           SikuliLibrary
Test Setup        Add Needed Image Path
Test Teardown     Stop Remote Server

*** Variables ***

${IMAGE_DIR}        ${CURDIR}\\img

*** Test Cases ***
Caso de Teste: Testando Bloco de Notas
    Clicar no menu Iniciar do Windows
    Digitar "Bloco de Notas" e precionar a tecla ENTER
    Digitar "PWX Tecnologia" na área em branco
    Checar se o texto "PWX Tecnologia" está escrito na tela
    Clicar no botão "X" para fechar e não salvar o arquivo

*** Keywords ***

Add Needed Image Path
    Add Image Path    ${IMAGE_DIR}

## Caso de Teste: Testando Bloco de Notas
Clicar no menu Iniciar do Windows
    Click       Menu_Iniciar.png

Digitar "Bloco de Notas" e precionar a tecla ENTER
    Input text      Barra_Pesquisa.png      Bloco de Notas
    Press Special Key       ENTER

Digitar "${TEXT}" na área em branco
    Input text      Tela_Digitação.png      ${TEXT}

Checar se o texto "${TEXT}" está escrito na tela
    Wait Until Screen Contain       Texto_Escrito.png       2

Clicar no botão "X" para fechar e não salvar o arquivo
    Click       Botão_Fechar.png
    Click       Não_Salvar