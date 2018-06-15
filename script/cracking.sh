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
          printf "\t$red[pwd_lin]$green unshadows linux credentials \n"
          printf "\t$red[pwd_win]$green creddump pwdump win credentials \n"
          printf "\t$red[jtr_lin]$green format=sha256 \n"
          printf "\t$red[jtr_win]$green format=nt \n"
          printf "\t$red[jtr_win_cr]$green format=nt | crunch attack \n"
          printf "\t$red[jtr_pass]$green Lista de pass jtr bug ? \n"
          printf "\t$red[md4_win7]$green Generador simple de HASH MD4 \n"
          printf "\t$red[mimipenguin]$green mimipenguin \n"
          printf "\t$red[v]$greenVolver \n"
          printf "\t$green==========================================\n"
          printf "\t$red [*]-:"
          printf $normal
                    
          read opc2
          case $opc2 in
          
          pwd_win)
                  pwdump CE/SYSTEM CE/SAM
                  pwdump CE/SYSTEM CE/SAM > CE/hash-win.enc
                  pause;;
          pwd_lin)
                  #grep -A 18 ENCRYPT_METHOD /etc/login.defs
                  sudo unshadow /etc/passwd /etc/shadow
                  sudo unshadow /etc/passwd /etc/shadow > CE/hash-lin.enc
                  pause;;        
            
          jtr_lin)             
                 /opt/john/run/john --pot=/opt/john/run/john.pot -w=CE/pass.lst CE/hash-lin.enc
                 /opt/john/run/john --show hash-lin.enc
                 pause;;
            
          jtr_win)
                 /opt/john/run/john --pot=/opt/john/run/john.pot -format=nt -w=CE/pass2.lst CE/hash-win.enc
                 /opt/john/run/john --show CE/hash-win.enc
                 pause;;
            
     jtr_win_cr)    
                pwdump CE/SYSTEM CE/SAM > CE/hash-win.enc
                crunch 10 10 -t inicio%%%% |/opt/john/run/john --pot=/opt/john/run/john.pot -format=nt --stdin CE/hash-win.enc
                /opt/john/run/john --show CE/hash-win.enc
           pause;;
            
       jtr_pass) 
               cat /opt/john/run/john.pot    
          pause;;
         
       mimipenguin)
                   sudo mimipenguin
            pause;; 
            
       md4_win7)
               #****************************************************************************************
               caption='Ingrese el dominio:'
               simbol='[*]-:'
               say $caption $simbol
               #****************************************************************************************
               read pass
               printf '%s' $pass | iconv -t utf16le | openssl md4   
         pause;;         
          
          
                 v)
          return 0;;
     *)
          printf "Seleciona una opcion valida :)";
          pause;;          
  esac
        
done
