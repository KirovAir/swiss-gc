del *.o
mkdir built
powerpc-eabi-gcc -O2 -c wkf\base.S
powerpc-eabi-gcc -O2 -c wkf\wkf.c
powerpc-eabi-gcc -O2 -DDEBUG -c base\usbgecko.c
powerpc-eabi-ld -o wkf.elf base.o wkf.o usbgecko.o --section-start .text=0x80001800
del *.o
powerpc-eabi-objdump -D wkf.elf > built\wkf_disasm.txt
powerpc-eabi-objcopy -O binary wkf.elf wkf.bin
bin2s wkf.bin > wkf.s
mv -f wkf.s ../swiss/source/patches/wkfPatch.s
del *.bin
del *.elf
pause