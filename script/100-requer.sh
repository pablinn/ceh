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

#sudo masscan --exlude 255.255.255.255 -pU:5060 0.0.0.0/0 > 5061.txt



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
        printf "\t$red[9]$green       Pishing poisoning spoofing \n"
        printf "\t$red[10]$green      Anonymous\n"
        printf "\t$red[11]$green      Auxiliares\n"
        printf "\t$red[12]$green      Car Hacking\n"
        
        printf "\t$red[v]$green       Volver \n"
        printf "\t$green==========================================\n"
        printf "\t$red [*]-:"
       
        printf $normal
        
        read opc2
        case $opc2 in
     
     
     
     1)  
         chek dig
         chek whois
         
          #osint operative
          chek operative
          if [ $val == '0' ] 
          then
         
          sudo git clone https://github.com/graniet/operative-framework.git /opt/operative-framework
          cd /opt/operative-framework
          pip install -r requirements.txt
          sudo chmod +x /opt/operative-framework/coperative.py
          sudo ln -s /opt/operative-framework/operative.py /usr/local/bin/operative
          fi
         
          
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
         
         
            chek scp
          chek nc
          chek telnet
          chek ssh
          chek ftp
          
          chek modbus
          if [ $val == '0' ]
          then
          sudo apt-get install ruby
          sudo gem install modbus-cli
          fi
          
          chek nmblookup
          if [ $val == '0' ]
          then
          sudo apt-get install samba-common-bin
          fi
                   
                    
          chek nmap
          if [ $val == '0' ]
          then
         
          sudo apt-get install nmap
          sudo git clone https://github.com/scipag/vulscan.git usr/share/nmap/scripts/ 
          fi
       
          chek tshark
          if [ $val == '0' ]
          then
            sudo apt-get install tshark
          fi
          
          chek msfconsole
          chek msfvenom
          chek ps1encode
          
          
          
      pause;;
      
      3) #web attack  burpsuite owasap sqlmap
          chek snmpwalk
          chek exiftool
          #winetricks
          #scapy
          #jupyter-notebook
          #sudo jupyter notebook --allow
          
          #wine
          #mv
          
          chek sqlmap
          if [ $val == '0' ]
          then
            #https://github.com/sqlmapproject/sqlmap.git
            sudo git clone https://github.com/sqlmapproject/sqlmap.git /opt/sqlmap
            sudo ln -s /opt/sqlmap/sqlmap.py /usr/local/bin/sqlmap
          fi
          
          chek loiq
          #/opt/loiq-0.3.1a/loiq
          
          
         
      
      pause;;
      
      4) #wifi
        
        
        chek genpmk
        chek aircrack-ng
        chek pyrit
      #chek  wifite 1 comentado wifite2
          if [ $val == '0' ]
          then
       
          #git clone https://github.com/derv82/wifite.git soft/wifite
          #cd soft/wifite
          #chmod +x wifite.py
          #sudo mv wifite.py /usr/local/bin/wifite.py
                    
          sudo git clone https://github.com/derv82/wifite2 /opt/wifite2
          sudo chmod +x /opt/wifite2/Wifite.py
          sudo ln -sf /opt/wifite2/Wifite.py /usr/local/bin/wifite
          fi 
          
          chek searchsploit
          if [ $val == '0' ]
          then
      
          xdotool exec --sync --args 2  firefox https://www.exploit-db.com/
          sudo git clone https://github.com/offensive-security/exploit-database.git /opt/exploit-database
          sudo ln -sf /opt/exploit-database/searchsploit /usr/local/bin/searchsploit
          sudo ln -sf /opt/exploit-database/searchsploit /usr/bin/searchsploit
          sudo ln -sf /opt/exploit-database/searchsploit /usr/sbin/searchsploit
          fi
          
      
      #cowpatty 
        chek cowpatty
         if [ $val == '0' ]
         then
          sudo apt-get install libpcap-dev libssl-dev build-essential libpcap0.8-dev libdigest-hmac-perl
          wget http://www.willhackforsushi.com/code/cowpatty/4.6/cowpatty-4.6.tgz
          tar zxvf  cowpatty-4.6.tgz
          cd cowpatty-4.6
          make
          sudo make install
          sudo rm cowpatty*
         fi
          
         chek wifi_honey 
         if [ $val == '0' ]
         then
          wget https://digi.ninja/files/wifi_honey_1.0.tar.bz2
          sudo apt-get install screen
          tar xvfj wifi_honey_1.0.tar.bz2
          sudo rm wifi_honey_1.0.tar.bz2
          sudo mv wifi_honey /opt/
          sudo chmod +x /opt/wifi_honey/wifi_honey.sh
          sudo ln -sf /opt//wifi_honey/wifi_honey.sh /usr/local/bin/wifi_honey
         fi
           
         chek reaver 
         if [ $val == '0' ]
         then
          sudo apt-get -y install build-essential libpcap-dev aircrack-ng
          sudo git clone https://github.com/t6x/reaver-wps-fork-t6x.git soft/reaver-wps-fork-t6x
          cd reaver-wps-fork-t6x*
          cd src
          ./configure
          make
          sudo make install
         fi
             
          
          
      pause;;
      
      5) # crack password  
      
      
          chek crunch
          if [ $val == '0' ]
          then
          echo "No está instalado \"$1\"."
          fi
          
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
      
      6)  
           chek gr-gsm
          if [ $val == '0' ] 
          then
              sudo apt-get install cmake libboost-all-dev libcppunit-dev swig doxygen liblog4cpp5-dev python-scipy
              sudo apt-get install gnuradio gnuradio-dev
              sudo apt-get install rtl-sdr librtlsdr-dev
              sudo apt-get install osmo-sdr libosmosdr-dev gr-osmosdr 
              sudo apt-get install libosmocore libosmocore-dev
              
              sudo git clone https://github.com/ptrkrysik/gr-gsm.git /opt/gr-gsm
              cd /opt/gr-gsm
              sudo mkdir build
              cd build 
              sudo cmake ..
              sudo make
              sudo make install
              sudo ldconfig
              
              
               #vi  /etc/udev/rules.d/15-rtl-sdr.rules
               #SUBSYSTEMS=="usb", ATTRS{idVendor}=="0bda", ATTRS{idProduct}=="2838", MODE:="0666"
               #rtl_test -t
               #grgsm_livemon
               #sudo wireshark -k -Y '!icmp && gsmtap' -i lo
               
   #http://gqrx.dk/download/install-ubuntu gqrx
          fi
    
      
      pause;;
      
      8) # reversin debuger compiler
          
          chek gdb
          chek objdump
          chek file
          chek strace
          chek ltrace
          
          chek hte
          if [ $val == '0' ]
          then
           sudo apt-get install ht
          fi
          
          #chek edb
          if [ $val == '0' ]
          then
           #sudo apt-get install edb
            sudo git clone https://github.com/eteran/edb-debugger.git /opt/edb
            cd /opt/edb
            sudo mkdir build
            #cd build
            cmake
            make
          fi
          
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
          
          chek radare2
          
          if [ $val == '0' ] 
          then
          
          #sudo apt-get install radare2
                    
          sudo git clone https://github.com/radare/radare2 /opt/radare2
          sudo /opt/radare2/sys/install.sh
          
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
      
      9) # pishing - spoofing - flodding
      #bettercap
        chek bettercap
          if [ $val == '0' ]
          then
       
          sudo apt install build-essential ruby-dev libpcap-dev net-tools
          sudo apt install ruby
          sudo gem install bettercap
          gem update bettercap
          
          fi
      
      #ngrok
      chek ngrok
      if [ $val == '0' ]
         then
          #wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip
          sudo unzip  ngrok-stable-linux-amd64.zip -d /opt/ngrok
          sudo ln -s /opt/ngrok/ngrok /usr/bin/ngrok
      fi
      
      #weeman
      chek weeman
      if [ $val == '0' ]
         then
      sudo git clone https://github.com/samyoyo/weeman.git /opt/weeman
      sudo chmod +x /opt/weeman/weeman.py
      sudo ln -s /opt/weeman/weeman.py /usr/bin/weeman
      fi
      
      
      chek macchanger
          if [ $val == '0' ]
          then
         
          sudo apt-get install macchanger
          fi         
          
      
      pause;;
      
      10)# anonimato en la red
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
          chek tar
          chek wget
          chek xdotool
          chek wmctrl
          chek curl
          if [ $val == '0' ]
          then
           echo "No está instalado \"$1\"."
          fi
          
          chek git
          if [ $val == '0' ]
          then
          echo "No está instalado \"$1\"."
          fi
          
          chek adb
          if [ $val == '0' ]
          then
         
          sudo apt-get install android-tools-adb
          sudo apt-get install android-tools-fastboot
          #Bus 003 Device 021: ID 18d1:d001 Google Inc. 

          fi
          
          
          chek scapy
          #pyX
          
          #chek shodan
          if [ $val == '0' ]
          then
         
          sudo apt-get install pip
          pip install shodan
          fi
                 
          chek pyrit
          if [ $val == '0' ]
          then
          echo "No está instalado \"$1\"."
          fi
          
          chek mosquitto
          if [ $val == '0' ]
          then
         
          sudo apt-add-repository ppa:mosquitto-dev/mosquitto-ppa
          sudo apt-get update
          sudo apt-get install mosquitto
          sudo apt-get install mosquitto-clients
          sudo /etc/init.d/mosquitto start
          fi
       
      pause;;
      
      12)  
          chek vcan
          if [ $val == '0' ]
          then
           sudo apt-get install libsdl2-dev libsdl2-image-dev can-utils  
           sudo git clone https://github.com/zombieCraig/ICSim.git /opt/ICSim
           

         fi
        pause;;
         
      13)
      
        chek empire
          if [ $val == '0' ]
          then
           sudo git clone https://github.com/EmpireProject/Empire.git /opt/Empire
           cd /opt/Empire
           sudo  ./setup/install.sh
          fi   
      
      
        chek loiq
        if [ $val == '0' ]
          then
              sudo apt-get install libqtgui4:i386
              wget http://downloads.sourceforge.net/project/salix-sbo/13.37/loiq/loiq-0.3.1a.tar.bz2
              bzip2 -dc loiq-0.3.1a.tar.bz2 | tar -xv 
              sudo mv loiq-0.3.1a /opt/loiq-0.3.1a
              sudo ln -s /opt/loiq-0.3.1a/loiq /usr/local/bin/
        fi   
        pause;;
      
          
          
          v)
          return 0;;
        *)
          printf "Seleciona una opcion valida :)";
          pause;;          
  esac
        
done
