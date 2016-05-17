start /wait clean.bat
make
..\..\pc\utils\elf2dol swiss.elf swiss.dol
..\..\pc\utils\dollz3 swiss.dol swiss-lz.dol -m
..\..\pc\utils\dollz3 swiss.dol swiss-lz-viper.dol -m -v
mkdir dist
mkdir dist\DOL
mkdir dist\ISO
mkdir dist\WiikeyFusion
mkdir temp
mv swiss.elf dist\DOL
mv swiss.dol dist\DOL
mv swiss-lz.dol dist\DOL
mv swiss-lz-viper.dol dist\DOL
copy dist\DOL\swiss-lz.dol temp\boot.dol
..\..\pc\utils\mkisofs.exe -R -J -G ..\..\pc\utils\eltorito-e-new.hdr -no-emul-boot -b boot.dol -o swiss(pal).gcm temp
..\..\pc\utils\mkisofs.exe -R -J -G ..\..\pc\utils\eltorito-u.hdr -no-emul-boot -b boot.dol -o swiss(ntsc).gcm temp
..\..\pc\utils\mkisofs.exe -R -J -G ..\..\pc\utils\eltorito-j.hdr -no-emul-boot -b boot.dol -o swiss(ntsc-j).gcm temp
copy swiss(pal).gcm swiss.fzn
mv swiss(pal).gcm dist\ISO
mv swiss(ntsc).gcm dist\ISO
mv swiss(ntsc-j).gcm dist\ISO
..\..\pc\utils\trimmer swiss.fzn 1900544
mv swiss.fzn dist\WiikeyFusion
copy ..\wiikey\fusion.fzn.fw dist\WiikeyFusion\swiss.fzn.fw
rmdir temp /s /q
pause