#!/bin/sh
black=$(tput setaf 0)
red=$(tput setaf 1)
green=$(tput setaf 2)
yellow=$(tput setaf 3)
blue=$(tput setaf 4)
magenta=$(tput setaf 5)
cyan=$(tput setaf 6)
white=$(tput setaf 7)

normal=$(tput sgr0)

pause(){
  read -p "[Enter] para continuar..." Key
}

#whois -h whois.nic.ar tgn.com.ar >> 00.txt
# enscript -p- 00.txt | ps2pdf - hola.pdf 


val='0'
chek(){
	if [ -x /usr/bin/$1 ] || [ -x /usr/sbin/$1 ] || [ -x /usr/local/bin/$1 ] || [ -x /bin/$1 ]; then
          echo "El programa \"$1\" está instalado."
          val='1'
           else
          echo "No está instalado \"$1\"."
          val='0'
          
          fi
          
     
}

say(){

if [ $val == '0' ]
             then
               echo -n $caption
               echo -n $simbol
             else
               echo -n $caption | iconv -f utf-8 -t iso-8859-1|festival --tts
               echo -n $simbol
             fi     
}   


#soporte para voz comentar si no se desea esta capacidad
#chek festival


while true

do
clear
          printf "\t$green==========================================\n"
          printf "\t$red                CE-COUNCIL test\n"
          printf "\t$green==========================================\n"
          printf "\t$red[file]$green      File path:/ceh/code\n"
          printf "\t$red[gdb]$green       GDB Debuger AT&T\n"
          printf "\t$red[objdump]$green   Objdunp file main INTEL\n"
          printf "\t$red[strace]$green    Muesra librerias y parametros\n"
          printf "\t$red[gcc]$green       gcc / gcc-arm\n"
          printf "\t$red[as]$green        asm-x86 / asm-arm\n"
          printf "\t$red[hte]$green       HTE AR\n"
          printf "\t$red[v]$greenVolver \n"
          printf "\t$green==========================================\n"
          printf "\t$red [*]-:"
          printf $normal
          
          read opc2
          case $opc2 in
          
          file)
                 #****************************************************************************************
                 caption='Ingrese el dominio:'
                 simbol='[*]-:'
                 say $caption $simbol
                 #****************************************************************************************
                 
                 read arch
                 file code/$arch
          pause;;
          
          objdump) #intel
                 #****************************************************************************************
                 caption='Ingrese el dominio:'
                 simbol='[*]-:'
                 say $caption $simbol
                 #****************************************************************************************
                 
                 read arch
                 objdump -M intel -d code/$arch | grep -FA15 '<main>'
          pause;;
          
        gdb)     # AT&T
                 #****************************************************************************************
                 caption='Ingrese el nombre del program:'
                 simbol='[*]-:'
                 say $caption $simbol
                 #****************************************************************************************
                 
                 read arch
                 gdb code/./$arch
       pause;;
          
      strace)
                 #****************************************************************************************
                 caption='Ingrese el nombre del program:'
                 simbol='[*]-:'
                 say $caption $simbol
                 #****************************************************************************************
                 
                 read arch
                 strace code/./$arch
      pause;;
          
     
      
          
          hte)
          
          pause;;
          
          
       gcc)
          cpu=$(gcc -dumpmachine)
          
          printf "Ingrese el archivo en C a compilar: \n" #| iconv -f utf-8 -t iso-8859-1|festival --tts
          path=${PWD}"/code/"
          read nom_f
          printf "\nCross compiler: y/n: "
          read val
          
          if [ $cpu == "x86_64-linux-gnu" ] || [ $val == "y" ]
          then
          gcc -fno-stack-protector -o $path$nom_f'_x86' $path$nom_f.c
          $path$nom_f'_x86'
          printf "compilaando para $cpu file:"$path$nom_f"_x86\n"
          fi
          
          if [ $cpu == "arm-linux-gnueabi" ] || [ $val == "y" ] 
          then
          arm-linux-gnueabihf-gcc -o $path$nom_f'_arm' $path$nom_f.c
          $path$nom_f'_arm'
          printf "compilaando para $cpu file:"$path$nom_f"_arm\n"
          fi
          
          pause;;
          
     as)
          cpu=$(gcc -dumpmachine)
          
          printf "\nArchivo en ASM: "
          path=${PWD}"/code/"
          read nom_f
          printf "\nCross compiler: y/n: "
          read val
          
          if [ $cpu == "x86_64-linux-gnu" ] || [ $val == "y" ]
          then
          as -o $path$nom_f.o $path$nom_f.s 
          gcc -fno-stack-protector -o $path$nom_f'_x86' $path$nom_f.o
          $path$nom_f'_x86'
          printf "compilaando para $cpu file:"$path$nom_f"_x86\n"
          fi
          
          if [ $cpu == "arm-linux-gnueabi" ] || [ $val == "y" ] 
          then
          
          arm-linux-gnueabihf-as  -o $path$nom_f.o $path$nom_f.s
          arm-linux-gnueabihf-gcc -o $path$nom_f'_arm' $path$nom_f.o
          $path$nom_f'_arm'
          printf "compilaando para $cpu file:"$path$nom_f"_arm\n"
          fi
                    
          pause;;
     
                 v)
          return 0;;
     *)
          printf "Seleciona una opcion valida :)";
          pause;;          
  esac
        
done
