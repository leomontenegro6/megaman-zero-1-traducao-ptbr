; Script de inserção de gráficos na rom
.gba

.open "mmz1.gba", 0x08000000

; Inserindo gráficos descomprimidos.
.org 0x080C9590
    .incbin "Graficos/Editados/Fonte dialogos.gba"
.org 0x080D0D90
    .incbin "Graficos/Editados/Fonte pequena.gba"
.org 0x082F4B14
    .incbin "Graficos/Editados/Copyright.gba"
.org 0x082F5A94
    .incbin "Graficos/Editados/Menu Status.gba"
.org 0x082F9A94
    .incbin "Graficos/Editados/Menu Opcoes.gba"
.org 0x082FFE34
    .incbin "Graficos/Editados/Tela Resultados.gba"
.org 0x082E38C4
    .incbin "Graficos/Editados/Tela Resultados (tm).gba"
.org 0x087E9DAC
    .incbin "Graficos/Editados/Sound Only.gba"

; Expandido tilemap do "Tempo de Jogo" na tela de resultados.
.org 0x082E0A3C
    .string 0x54,0x20,0x55,0x20,0x56,0x20,0x57,0x20,0x58,0x20,0x59,0x20,0x5A,0x20,0x5B,0x20,0x5C,0x20

.close
