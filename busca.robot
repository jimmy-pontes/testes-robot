* Settings *

Library     Browser


* Test Cases *
Buscar um restaurante

    New Browser     chromium    False  
    New Page        https://parodifood.qaninja.academy/
    #Checkpoint da pg correta
    Get Text        span    contains    Nunca foi tão engraçado pedir comida
    Click           text=Estou com fome!

    #oi