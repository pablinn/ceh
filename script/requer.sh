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

chek(){
	if [ -x /usr/bin/$1 ] || [ -x /usr/sbin/$1 ] || [ -x /usr/local/bin/$1 ] || [ -x /bin/$1 ] ; then
          echo "El programa \"$1\" está instalado."
          val='1'
           else
          echo "No está instalado \"$1\"."
          val='0'
          
          fi
          
          
   
}




while true

do
clear
        printf "\t$green==========================================\n"
        printf "\t $green           Software requerido\n" 
        printf "\t$green==========================================\n"
        printf "\t$red[1]$green       Reconocimiento\n"
        printf "\t$red[2]$green       Escaneo\n"
        printf "\t$red[5]$green       Criptografia \n"
        printf "\t$red[6]$green       Cracking \n"
        
        printf "\t$red[8]$green       Reversing \n"
        
        printf "\t$red[10]$green      Anonymous\n"
        printf "\t$red[11]$green      Auxiliares\n"
        printf "\t$red[v]$green       Volver \n"
        printf "\t$green==========================================\n"
        printf "\t$red [*]-:"
       
        printf $normal
        
        read opc2
        case $opc2 in
     
     
     
     1)  
         chek dig
         chek whois
         
          
         
          
         #Harvester herramienta de osint
         #https://github.com/laramies/theHarvester.git
          chek harvester
          if [ $val == '0' ]
          then
           sudo git clone https://github.com/laramies/theHarvester.git /opt/theHarvester
           cd /opt/theHarvester
           pip install request
           sudo chmod +x /opt/theHarvester/theHarvester.py
           sudo ln -s /opt/theHarvester/theHarvester.py /usr/local/bin/harvester           
          fi
   
               
      pause;;
              
      2)
         chek nmap
         chek zenmap
          
          #masscan
          #https://github.com/robertdavidgraham/masscan
          chek masscan
           if [ $val == '0' ]
          then
           sudo apt-get install git gcc make libpcap-dev
           sudo git clone https://github.com/robertdavidgraham/masscan /opt/masscan
           cd /opt/masscan
           make
           sudo make install 
          fi
         
      pause;;
      
      5)
           #john the riper pasword craker win (sam system) / linux (passwd shadow)
          #https://github.com/magnumripper/JohnTheRipper.git 
          chek john
          if [ $val == '0' ] 
          then
           sudo git clone https://github.com/magnumripper/JohnTheRipper.git /opt/john
           cd /opt/john/src
           ./configure && make -s clean && make -sj4
           sudo ln -s /opt/john/run/john /usr/local/bin/john
           sudo ln -s /opt/john/run/john /usr/sbin/john
           sudo ln -s /opt/john/run/unshadow /usr/sbin/unshadow
          fi
        
          #creddump (pwdump - lsadump - cachedump)
          #https://github.com/moyix/creddump.git
          chek pwdump 
          if [ $val == '0' ] 
          then
           sudo git clone https://github.com/moyix/creddump.git /opt/creddump
           sudo ln -s /opt/creddump/pwdump.py /usr/sbin/pwdump
           sudo ln -s /opt/creddump/cachedump.py /usr/sbin/cachedump
           sudo ln -s /opt/creddump/lsadump.py /usr/sbin/lsadump
         fi
         
          #hashcat password ceaker windows - linux - wifi 
          #https://github.com/hashcat/hashcat.git
          chek hashcat
          if [ $val == '0' ] 
          then
           sudo apt install cmake build-essential
           sudo apt install checkinstall git
           sudo git clone https://github.com/hashcat/hashcat.git /opt/hashcat
           cd /opt/hashcat
           sudo git submodule update --init
           make
           sudo make install
           #wget http://registrationcenter-download.intel.com/akdlm/irc_nas/9019/opencl_runtime_16.1.1_x64_ubuntu_6.4.0.25.tgz
           #tar zxvf f
           #install.sh
          fi
         
          #Mimipenguin version de miikatz para linux
          #https://github.com/huntergregal/mimipenguin.git
          chek mimipenguin
          if [ $val == '0' ] 
          then
           sudo git clone https://github.com/huntergregal/mimipenguin.git /opt/mimipenguin
           sudo ln -s /opt/mimipenguin/mimipenguin.sh /usr/sbin/mimipenguin
          fi
   
          
      pause;;
      
      8) 
      
          chek hte
          if [ $val == '0' ]
          then
           sudo apt-get install ht
          fi
          
          chek edb
          if [ $val == '0' ]
          then
           #sudo apt-get install edb
            sudo git clone --recursive https://github.com/eteran/edb-debugger.git /opt/edb
            cd /opt/edb
            mkdir build
            cd build
            cmake ..
            make
           ./edb
          fi
          
          chek gdb
          chek objdump
          chek file
          chek strace
          chek hte
          #chek bokken
        
          chek gcc
          if [ $val == '0' ]
          then
          echo "No está instalado \"$1\"."
          fi
          
          chek as
          if [ $val == '0' ]
          then
          echo "No está instalado \"$1\"."
          fi
              
          
          chek arm-linux-gnueabihf-gcc
          if [ $val == '0' ]
          then
         
          sudo apt-get install gcc-arm-linux-gnueabihf
          fi
                             
          chek arm-linux-gnueabi-gcc
          if [ $val == '0' ]
          then
         
          sudo apt-get install gcc-arm-linux-gnueabi
          fi
          
          #chek bokken
          if [ $val == '0' ] 
          then
          
          sudo git clone https://github.com/radare/radare2 /opt/bokken/radare2
          sudo /opt/bokken/radare2/sys/install.sh
          
          #sudo git clone https://github.com/radare/valabind /opt/bokken/valabind
          #cd /opt/bokken/valabind
          #make
          #sudo make install PREFIX=/usr
          
          #sudo git clone https://github.com/radare/radare2-bindings /opt/bokken/radare2-bindings
          #cd /opt/bokken/radare2-bindings
          #sudo ./configure --prefix=/usr
          #cd phyton
          #sudo make
          #sudo make install
          
          #sudo git clone https://github.com/radare/ired /opt/bokken/ired
          #cd /opt/bokken/ired
          #sudo make
          #sudo make install
          
          #sudo git clone https://github.com/radare/bokken /opt/bokken/bokken
          #cd /opt/bokken/bokken
          #sudo ln -s /opt/bokken/bokken/bokken.py /usr/sbin/bokken
          fi
          
      
      pause;;
      10)
          chek tor
          chek proxychains
          
          #tor web browser
          chek tor_web
          if [ $val == '0' ] 
          then
          wget https://www.torproject.org/dist/torbrowser/7.5.3/tor-browser-linux64-7.5.3_es-ES.tar.xz
          tar xf  tor-browser-linux64-7.5.3_es-ES.tar.xz
          rm tor-browser-linux64-7.5.3_es-ES.tar.xz
          sudo mv tor-browser* /opt/
          sudo ln -sf /opt/tor-browser_es-ES/browser/start-tor-browser /usr/local/bin/tor_web
          fi
          
          
      pause;;    
      
      11)
          echo "TTS para comando de voz"
          chek festival
          echo "Generacion de PDF"
          chek enscript
          chek ps2pdf 
      
      pause;;
          v)
          return 0;;
        *)
          printf "Seleciona una opcion valida :)";
          pause;;          
  esac
        
done
