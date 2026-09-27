; Script de inserção de gráficos na rom
.gba

.open "mmz1.gba", 0x08000000

; Inserindo fontes.
.org 0x080C9590
    .incbin "Graficos/Editados/Fonte dialogos.gba"
.org 0x080D0D90
    .incbin "Graficos/Editados/Fonte pequena.gba"

; Inserindo copyright.
.org 0x082F4B14
    .incbin "Graficos/Editados/Copyright.gba"

.close
