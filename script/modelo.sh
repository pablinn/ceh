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

#reconocimiento  -->recoelccion de informacion - enumeracion - investigacion
#escaneo  --> identificacion de vulnerabilidades - definicion de vectores de ataque - validacion de la vulnerabilidad
#evaluacion --> pruebas con exploits - pruebas con credenciales - penetracion - escalamiento dprivilegios - post explotacion 
#analisis --> evaluacion de riesgo - reporte.
  



while true

do
clear
          printf "\t$green==========================================\n"
          
                   printf "\t$red[v]$greenVolver \n"
          printf "\t$green==========================================\n"
          printf "\t$red [*]-:"
          printf $normal
          
          read opc2
          case $opc2 in
          
                 v)
          return 0;;
     *)
          printf "Seleciona una opcion valida :)";
          pause;;          
  esac
        
done
