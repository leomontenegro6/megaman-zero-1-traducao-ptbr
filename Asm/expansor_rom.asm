; Script de expansão da rom pra 16mb
.gba
.open "mmz1.gba", 0x08000000
.orga filesize("mmz1.gba")
.fill 16777216 - filesize("mmz1.gba"), 0xff
.close