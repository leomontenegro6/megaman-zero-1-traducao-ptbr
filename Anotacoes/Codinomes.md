# Lista de codinomes

Essa é a nova lista de codinomes, traduzidos pelo MJay na sua retradução pra coletânea:

|Original  |Traduzido   |Requisito
|----------|------------|------------------------------------------------------|
|HUNTER    |CAÇADOR     |Codinome inicial.                                     |
|WARRIOR   |GUERREIRO   |Nenhuma arma usada mais que outras em missão.         |
|HERO	   |HERÓI       |Nível S obtido uma vez.                               |
|SUPERHERO |SUPER-HERÓI |Nível S obtido 3 vezes seguidas.                      |
|SAVIOR    |SALVADOR    |Nível S obtido 5 vezes seguidas.                      |
|IMMORTAL  |IMORTAL     |Nível S obtido 7 vezes seguidas.                      |
|PACIFIST  |PACIFISTA   |Matou poucos ou nenhum inimigo em missão.             |
|SPEEDSTER |CORREDOR    |Terminou missão em tempo recorde.                     |
|DESTROYER |DESTRUIDOR  |Matou muito mais inimigos do que o necessário.        |
|SLAYER    |ASSASSINO   |Sabre Z usado mais que outras armas em missão.        |
|SNIPER    |ATIRADOR    |Pistola usada mais que outras armas em missão.        |
|ERROR     |ERROR       |Não-usado.                                            |
|SLOWPOKE  |LESMA       |Levou tempo demais pra terminar missão.               |
|BUGGY	   |ENFERRUJADO |Nível F obtido.                                       |
|LAZY      |ACABADO     |Nível F obtido 3 vezes seguidas.                      |
|SCRAPPER  |SUCATA      |Nível F obtido 5 vezes seguidas.                      |
|CRASHER   |TRITURADO   |Nível F obtido 7 vezes seguidas.                      |
|COLLECTOR |COLECIONADOR|Colete todos os cyber-elfos, exceto Jackson.          |
|FEARFUL   |COVARDE     |Use a Unidade de Fuga para desistir de uma missão.    |
|MASTER    |MESTRE      |Complete o jogo na dificuldade Difícil                |

# Formato dos codinomes

Pelo visto, tem três instâncias separadas dos codinomes no MMZ1:

1. Uma nos scripts .tpl, usando a fonte padrão e mostrado em alguns diálogos de NPCs
2. Outra na tela de resultados, estando em ASCII e fazendo uso da fonte pequena
3. Uma terceira na tela de status, na forma de tilemaps, fazendo uso de um alfabeto reduzido, dentro do "Menu Opcoes.gba"

## Scripts .tpl

Esta primeira é a mais simples, consistindo apenas de alguns poucos diálogos de NPCs onde eles falam o codinome do jogador e comentam sobre. Faz uso da fonte padrão dos textos, no arquivo "Graficos/Editados/Fonte dialogos.gba". É possível exibir codinomes mais longos do que 9 ou 10 caracteres, porém desde que não passe dos limites das janelas de diálogos.

Os únicos scripts contendo menções a isso são o "misc_text.tpl" e o "msg02.tpl", através da tag `printCodeName`.

## Tela de Resultados

Na tela de resultados, os textos estão soltos na ROM, em formato ASCII, possuindo ponteiros absolutos padrões de GBA ao invés dos relativos existentes nos scripts .tpl. Faz uso da fonte no arquivo "Graficos/Editados/Fonte pequena.gba". Nessa tela, cada codinome deve ter idealmente 10 caracteres, pois acima disso passa da borda da janela.

O endereço deles na ROM é 0x0C9120. Para a edição, foi utilizado armips, onde o ponteiro de cada codinome foi catalogado, para em seguida os codinomes traduzidos serem inseridos numa área livre no final da ROM, e seus respectivos ponteiros absolutos tendo sido remanejados de acordo. O código disso está no arquivo "Asm/textos.asm".

## Tela de Status

Os codinomes na tela de status são talvez os mais complicados, pois é provável que haja uma limitação de tiles para cada codinome, requerendo fazer reduções e sacrifícios aqui e ali. Nessa tela, cada codinome tem no máximo 9 caracteres, e se quiser passar disso, precisaria expandir o tamanho dos tilemaps de cada codinome, requerendo uma edição ASM mais avançada. Além disso, faz uso não das fontes anteriores, mas sim de um alfabeto de tiles reduzido dentro de "Graficos/Editados/Tela Opcoes.gba", contendo apenas as letras maiúsculas em si, dificultando a ideia de escrever codinomes longos em menos letras. No entanto, parecem haver vários tiles não-usados que talvez dê pra reaproveitar.

O offset que os tilemaps dos codinomes se situam é 0x2CBFF1. Também foi usado armips para edição, onde eu simplesmente fui até o offset de cada codinome e editei seus valores, se assegurando de não passar de 9 caracteres.

É possível visualizar as letras usando WindHex combinado com o arquivo de tabela "tilemap_codinomes.tbl".