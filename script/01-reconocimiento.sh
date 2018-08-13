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


#https://foro.hackplayers.com/discussion/147/recursos-y-herramientas-para-el-descubrimiento-de-subdominios

while true

do
clear
          printf "\t$green==========================================\n"
          printf "\t$red           CEH - Ethical Hacking\n"
          printf "\t$green==========================================\n"
          printf "\t$red[whois_ar]$green    whois AR\n"
          printf "\t$red[whois]$green       whois\n"
          printf "\t$red[dig]$green         DIG \n"
          printf "\t$red[harvester]$green   Osint The harvester \n"
          printf "\t$red[web]$green         cencys \n"
          printf "\t$red[dork]$green        google dork \n"
          
          printf "\t$green==========================================\n"
          
                   printf "\t$red[v]$greenVolver \n"
          printf "\t$green==========================================\n"
          printf "\t$red [*]-:"
          printf $normal
          
          read opc2
          case $opc2 in
          
         whois_ar)
             #****************************************************************************************
             caption='Ingrese el dominio:'
             simbol='[*]-:'
             say $caption $simbol
             #****************************************************************************************
            read host
            whois -h whois.nic.ar $host | grep ':' > informe/$host.txt
            cat informe/$host.txt
            enscript -p- informe/$host.txt| ps2pdf - informe/$host.pdf
            #enscript -p- - | ls | ps2pdf - hola.pdf 
        pause;;

       whois)
             #****************************************************************************************
             caption='Ingrese el dominio:'
             simbol='[*]-:'
             say $caption $simbol
             #****************************************************************************************
            read host
            whois $host | grep ':' | sed '>>>' > informe/$host1.txt
            enscript -p- informe/$host1.txt| ps2pdf - informe/$host1.pdf

            #enscript -p- - | ls | ps2pdf - hola.pdf 
            
            pause;;
          dig)
             #****************************************************************************************
             caption='Ingrese el dominio:'
             simbol='[*]-:'
             say $caption $simbol
             #****************************************************************************************
            read host
            dig $host >> informe/$host2.txt
            enscript -p- informe/$host2.txt| ps2pdf - informe/$host2.pdf

            #enscript -p- - | ls | ps2pdf - hola.pdf 
            
            pause;;
    
          harvester)
                   #****************************************************************************************
                   caption='Ingrese el dominio:'
                   simbol='[*]-:'
                   say $caption $simbol
                   #****************************************************************************************
                   read host 
                   harvester -d $host -b linkedin
                   #harvester -d $host -b all >> informe/$host-harvester.txt
                   
          pause;;
                     
          web)
              #pentest-tool
              uri1='https://pentest-tools.com/information-gathering/find-subdomains-of-domain?run'
              #cencys
              uri2='https://censys.io/'
              #shodan
              uri3='http://shodan.io/'
              #dnsdumpster
              uri4='https://dnsdumpster.com/'
              #netcraft
              uri5='http://searchdns.netcraft.com/'
              
              firefox $uri1 $uri2 $uri3 
                
          pause;;
          
          dork)
          #site expose
          #site:pengowin.com.ar intitle:index.of
          #file expose
          #site:pengowin.com.ar ext:xml | ext:conf | ext:cnf | ext:reg | ext:inf | ext:rdp | ext:cfg | ext:txt | ext:ora | ext:ini
          
          #database expose
          #site:pengowin.com.ar ext:sql | ext:dbf | ext:mdb
          
          #log file expose
          #site:pengowin.com.ar ext:log
          
          #back up an old files
          #site:pengowin.com.ar ext:bkf | ext:bkp | ext:bak | ext:old | ext:backup
          
          #login pages
          #site:pengowin.com.ar inurl:login
          
          #sql errors
          #site:pengowin.com.ar intext:"sql syntax near" | intext:"syntax error has occurred" | intext:"incorrect syntax near" | intext:"unexpected end of SQL command" | intext:"Warning: mysql_connect()" | intext:"Warning: mysql_query()" | intext:"Warning: pg_connect()"
          
          #publicity expose
          #site:pengowin.com.ar ext:doc | ext:docx | ext:odt | ext:pdf | ext:rtf | ext:sxw | ext:psw | ext:ppt | ext:pptx | ext:pps | ext:csv
          
          #https://www.google.com/search?q=site:pengowin.com.ar+ext:php+intitle:phpinfo+%22published+by+the+PHP+Group%22
          
          
          pause;;
                
                v)
          return 0;;
     *)
          printf "Seleciona una opcion valida :)";
          pause;;          
  esac
        
done
