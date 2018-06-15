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
chek festival


while true

do
clear
          printf "\t$green==========================================\n"
          printf "\t$red           CEH - Ethical Hacking\n"
          printf "\t$green==========================================\n"
          printf "\t$red[os]$green       Scan nmap os\n"
          printf "\t$red[nmap]$green     Scan nmap puertos\n"
          printf "\t$red[nmap]$green     Scan nmap a traves de TOR\n"
          printf "\t$red[masscan]$green  Scan masscan \n"
          printf "\t$red[nexpose]$green  Scan web Nexpose \n"
          printf "\t$red[v]$green        Volver \n"
          printf "\t$green==========================================\n"
          printf "\t$red [*]-:"
          printf $normal
          
          read opc2
          case $opc2 in
         
         
         os)
                 #****************************************************************************************
                 caption='Ingrese la ip o el dominio:'
                 simbol='[*]-:'
                 say $caption $simbol
                 #****************************************************************************************
                 read host
                 sudo nmap -O $host >> informe/$host-os.txt
         pause;;
         
         nmap)
                 #****************************************************************************************
                 caption='Ingrese la ip o el dominio:'
                 simbol='[*]-:'
                 say $caption $simbol
                 #****************************************************************************************
                 read host
                 sudo nmap -A -Pn $host >> informe/$host-scan.txt
         pause;;
         
         t_nmap)
                 #****************************************************************************************
                 caption='Ingrese la ip o el dominio:'
                 simbol='[*]-:'
                 say $caption $simbol
                 #****************************************************************************************
                 read host
                 proxychains nmap -A -Pn $host 
         pause;;
         
           
          
          
         masscan)
                 #****************************************************************************************
                 caption='Ingrese el dominio:'
                 simbol='[*]-:'
                 say $caption $simbol
                 #****************************************************************************************
                 read host
                 sudo masscan $host --port 0-65535
         pause;; 
                
         nexpose)
                 uri1='https://www.rapid7.com/products/nexpose/'
                 firefox $uri1 
         pause;;
                
         v)
          return 0;;
     *)
          printf "Seleciona una opcion valida :)";
          pause;;          
  esac
        
done
