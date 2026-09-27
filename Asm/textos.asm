; Script de inserção de scripts na rom
.gba

.open "mmz1.gba", 0x08000000

.org 0x082B8F3C
.area 0x082BB1C5 - 0x082B8F3C, 0xFF
    .incbin "Scripts/Compilados/misc_text.msg"
.endarea

; Scripts inseridos no final da rom.
; Catalogando ponteiros dos scripts.
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

; Inserindo dados no final da rom
.orga filesize("mmz1.gba")
.align

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

.close
