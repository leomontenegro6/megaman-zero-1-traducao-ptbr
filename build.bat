:: Arquivo .bat que remonta a rom traduzida.
:: Uso: build.bat [-restoration] [-revisited]
:: Onde:
::   -restoration: Aplica o patch de restauração (opcional)
::   -revisited: Aplica o patch de revisitação (opcional)
@echo off
setlocal EnableDelayedExpansion
echo ==Gerando rom traduzida.==

REM Inicializa flags
set restoration=0
set revisited=0

REM Percorre todos os argumentos
for %%A in (%*) do (
    if /I "%%A"=="-restoration" set restoration=1
    if /I "%%A"=="-revisited" set revisited=1
)

del mmz1.gba
copy orig.gba mmz1.gba

if !restoration! equ 1 (
    echo ==Aplicando IPS do Megaman Zero Restoration.==
    .\Ferramentas\flips.exe --apply ".\Arquivos Patches\mmz_restoration\Mega Man Zero Restoration.ips" .\mmz1.gba .\mmz1.gba
)

if !revisited! equ 1 (
    echo ==Aplicando IPS do Megaman Zero Revisited.==
    .\Ferramentas\flips.exe --apply ".\Arquivos Patches\mmz_revisited\mmz1_revisited.ips" .\mmz1.gba .\mmz1.gba
)

echo ==Inserindo textos traduzidos.==
.\Ferramentas\TextPet.exe run-script insert-scripts.tpl
php .\consertar_ponteiros_scripts.php
.\Ferramentas\armips.exe .\Asm\textos.asm

echo ==Aplicando patches de graficos editados.==
.\Ferramentas\flips.exe --apply .\mmz1_graphics.ips .\mmz1.gba .\mmz1.gba
.\Ferramentas\armips.exe .\Asm\graficos.asm

echo ==Expandindo a rom para 16mb==
.\Ferramentas\armips.exe .\Asm\expansor_rom.asm

echo Done.