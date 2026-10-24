@echo off
call build.bat
.\Ferramentas\flips.exe -c "orig.gba" "mmz1.gba" "mmz1 [U] v11.ips"

call build.bat -restoration -revisited
.\Ferramentas\flips.exe -c "orig.gba" "mmz1.gba" "mmz1_improved.ips"

.\Ferramentas\7z.exe a -tzip "[GBA] Mega Man Zero (U) (1.1).zip"^
    "mmz1 [U] v11.ips"^
    "LEIAME.txt"^
    "mmz1_improved.ips"

del "mmz1 [U] v11.ips"
del "mmz1_improved.ips"