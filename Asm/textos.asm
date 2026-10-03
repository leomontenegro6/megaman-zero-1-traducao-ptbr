; Script de inserção de scripts na rom
.gba

.open "mmz1.gba", 0x08000000

; Codenomes na tela de status, na forma de tilemaps.
.loadtable "Tabelas/tilemap_codinomes.tbl"
.org 0x082CBFEE
    .stringn "  CAÇADOR"
.org 0x082CC000
    .stringn "GUERREIRO"
.org 0x082CC012
    .stringn "    HERÓI"
.org 0x082CC024
    .stringn "{super-herói}" ; Encurtado com tiles sobrando
.org 0x082CC036
    .stringn " SALVADOR"
.org 0x082CC048
    .stringn "  IMORTAL"
.org 0x082CC05A
    .stringn "PACIFISTA"
.org 0x082CC06C
    .stringn " CORREDOR"
.org 0x082CC07E
    .stringn "{destruidor}" ; Encurtado com tiles sobrando
.org 0x082CC090
    .stringn "ASSASSINO"
.org 0x082CC0A2
    .stringn " ATIRADOR"
.org 0x082CC0C6
    .stringn "    LESMA"
.org 0x082CC0D8
    .stringn "{enferrujado}" ; Encurtado com tiles sobrando
.org 0x082CC0EA
    .stringn "  ACABADO"
.org 0x082CC0FC
    .stringn "   SUCATA"
.org 0x082CC10E
    .stringn "TRITURADO"
.org 0x082CC120
    .stringn "{colecionador}" ; Encurtado com tiles sobrando
.org 0x082CC132
    .stringn "  MEDROSO"

; Script de textos diversos, inserido no mesmo offset do original,
; porém delimitado para não passar do offset onde ele termina.
.org 0x082B8F3C
.area 0x082BB1C5 - 0x082B8F3C, 0xFF
    .incbin "Scripts/Compilados/misc_text.msg"
.endarea

; Catalogando ponteiros dos scripts.
; Scripts do modo história, inseridos no final da rom.
.org 0x082BB1D4
    .dw Msg00
.org 0x082BB220
    .dw Msg00 + 0x008E

.org 0x082BB1D8
    .dw Msg01
.org 0x082BB224
    .dw Msg01 + 0x0038

.org 0x082BB1DC
    .dw Msg02
.org 0x082BB228
    .dw Msg02 + 0x01D8

.org 0x082BB1E0
    .dw Msg03
.org 0x082BB22C
    .dw Msg03 + 0x0042

.org 0x082BB1E4
    .dw Msg04
.org 0x082BB230
    .dw Msg04 + 0x000E

.org 0x082BB1E8
    .dw Msg05
.org 0x082BB234
    .dw Msg05 + 0x0018

.org 0x082BB1EC
    .dw Msg06
.org 0x082BB238
    .dw Msg06 + 0x0010

.org 0x082BB1F0
    .dw Msg07
.org 0x082BB23C
    .dw Msg07 + 0x0010

.org 0x082BB1F4
    .dw Msg08
.org 0x082BB240
    .dw Msg08 + 0x000E

.org 0x082BB1F8
    .dw Msg09
.org 0x082BB244
    .dw Msg09 + 0x0010

.org 0x082BB1FC
    .dw Msg0A
.org 0x082BB248
    .dw Msg0A + 0x0022

.org 0x082BB200
    .dw Msg0B
.org 0x082BB24C
    .dw Msg0B + 0x002C

.org 0x082BB204
    .dw Msg0C
.org 0x082BB250
    .dw Msg0C + 0x0016

.org 0x082BB208
    .dw Msg0D
.org 0x082BB254
    .dw Msg0D + 0x004A

.org 0x082BB20C
    .dw Msg0E
.org 0x082BB258
    .dw Msg0E + 0x001A

.org 0x082BB210
    .dw Msg0F
.org 0x082BB25C
    .dw Msg0F + 0x0010

.org 0x082BB214
    .dw Msg10
.org 0x082BB260
    .dw Msg10 + 0x0004

.org 0x082BB218
    .dw Msg11
.org 0x082BB264
    .dw Msg11 + 0x0004
    
.org 0x082BB21C
    .dw Msg12
.org 0x082BB268
    .dw Msg12 + 0x0038

.org 0x0829FA74
    .dw ResultsMaster
.org 0x0829FA70
    .dw ResultsFearful
.org 0x0829FA6C
    .dw ResultsCollector
.org 0x0829FA68
    .dw ResultsCrasher
.org 0x0829FA64
    .dw ResultsScrapper
.org 0x0829FA60
    .dw ResultsLazy
.org 0x0829FA5C
    .dw ResultsBuggy
.org 0x0829FA58
    .dw ResultsSlowpoke
.org 0x0829FA50
    .dw ResultsSniper
.org 0x0829FA4C
    .dw ResultsSlayer
.org 0x0829FA48
    .dw ResultsDestroyer
.org 0x0829FA44
    .dw ResultsSpeedster
.org 0x0829FA40
    .dw ResultsPacifist
.org 0x0829FA3C
    .dw ResultsImmortal
.org 0x0829FA38
    .dw ResultsSavior
.org 0x0829FA34
    .dw ResultsSuperhero
.org 0x0829FA30
    .dw ResultsHero
.org 0x0829FA2C
    .dw ResultsWarrior
.org 0x0829FA28
    .dw ResultsHunter

; Inserindo dados no final da rom
.orga filesize("mmz1.gba")
.align

; Scripts compilados
Msg00:
    .incbin "Scripts/Compilados/msg00.msg"
    .align

Msg01:
    .incbin "Scripts/Compilados/msg01.msg"
    .align

Msg02:
    .incbin "Scripts/Compilados/msg02.msg"
    .align

Msg03:
    .incbin "Scripts/Compilados/msg03.msg"
    .align

Msg04:
    .incbin "Scripts/Compilados/msg04.msg"
    .align

Msg05:
    .incbin "Scripts/Compilados/msg05.msg"
    .align

Msg06:
    .incbin "Scripts/Compilados/msg06.msg"
    .align

Msg07:
    .incbin "Scripts/Compilados/msg07.msg"
    .align

Msg08:
    .incbin "Scripts/Compilados/msg08.msg"
    .align

Msg09:
    .incbin "Scripts/Compilados/msg09.msg"
    .align

Msg0A:
    .incbin "Scripts/Compilados/msg0A.msg"
    .align

Msg0B:
   .incbin "Scripts/Compilados/msg0B.msg"
   .align

Msg0C:
    .incbin "Scripts/Compilados/msg0C.msg"
    .align

Msg0D:
    .incbin "Scripts/Compilados/msg0D.msg"
    .align

Msg0E:
    .incbin "Scripts/Compilados/msg0E.msg"
    .align

Msg0F:
    .incbin "Scripts/Compilados/msg0F.msg"
    .align

Msg10:
    .incbin "Scripts/Compilados/msg10.msg"
    .align

Msg11:
    .incbin "Scripts/Compilados/msg11.msg"
    .align

Msg12:
    .incbin "Scripts/Compilados/msg12.msg"
    .align

; Codinomes na tela de resultados
.loadtable "Tabelas/fonte_pequena.tbl"
ResultsMaster:
    .stringn "MESTRE", 0x00
    .align

ResultsFearful:
    .stringn "COVARDE", 0x00
    .align

ResultsCollector:
    .stringn "{colecionador}", 0x00
    .align

ResultsCrasher:
    .stringn "TRITURADO", 0x00
    .align

ResultsScrapper:
    .stringn "SUCATA", 0x00
    .align

ResultsLazy:
    .stringn "ACABADO", 0x00
    .align

ResultsBuggy:
    .stringn "{enferrujado}", 0x00
    .align

ResultsSlowpoke:
    .stringn "LESMA", 0x00
    .align

ResultsSniper:
    .stringn "ATIRADOR", 0x00
    .align

ResultsSlayer:
    .stringn "ASSASSINO", 0x00
    .align

ResultsDestroyer:
    .stringn "DESTRUIDOR", 0x00
    .align

ResultsSpeedster:
    .stringn "CORREDOR", 0x00
    .align

ResultsPacifist:
    .stringn "PACIFISTA", 0x00
    .align

ResultsImmortal:
    .stringn "IMORTAL", 0x00
    .align

ResultsSavior:
    .stringn "SALVADOR", 0x00
    .align

ResultsSuperhero:
    .stringn "SUPER-HERÓI", 0x00
    .align

ResultsHero:
    .stringn "HERÓI", 0x00
    .align

ResultsWarrior:
    .stringn "GUERREIRO", 0x00
    .align

ResultsHunter:
    .stringn "CAÇADOR", 0x00
    .align

.close
