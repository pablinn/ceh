#[CEH]
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

user1=$(whoami)


#reconocimiento  -->recoelccion de informacion - enumeracion - investigacion
#escaneo  --> identificacion de vulnerabilidades - definicion de vectores de ataque - validacion de la vulnerabilidad
#evaluacion --> pruebas con exploits - pruebas con credenciales - penetracion - escalamiento dprivilegios - post explotacion 
#analisis --> evaluacion de riesgo - reporte.
  


while :
do
if [ "$user1" == "root" ]; then
  echo " no root"
  # sudo -u raamee my_script
fi
    
    clear
    printf "\t$green==========================================\n"
    printf "\t$red           CEH - Ethical Hacking\n"
    printf "\t$green==========================================\n"
    printf "\t$red[1]$green    Fase de Reconocimiento      \n"    
    printf "\t$red[2]$green    Fase de Escaneo   \n"    
    printf "\t$red[3]$green    Fase de Evaluacion\n" 
    printf "\t$red[4]$green    Fase de Analisis \n"
    printf "\t$red[5]$green    Criptografia \n"
    printf "\t$red[6]$green    Cracking \n"
    printf "\t$red[7]$green    Gen Malware \n"
    printf "\t$red[8]$green    Reversing malware\n"
    printf "\t$red[r]$green    Comprueba/Instala laboratorio software \n"
    printf "\t$red[s]$green    Salir\n"
    printf "\t$green==========================================\n"
    printf "\t$red[*]-:"
    printf $normal
    
    read opc
    case $opc in
     
     1)
        source script/reconocimiento.sh
     pause;;
        
     2) 
        source script/escaneo.sh
     pause;;

     3)
        source script/shellcode.sh
     pause;;
 
     5)
        source script/crypto.sh
     pause;;
     
     6) 
        source script/cracking.sh
     pause;;
          
     7)
        source script/malware.sh
     pause;; 
    
     8)
         source script/reversing.sh
     
     pause;;
     
     r)     
        source script/requer.sh    
     pause;;
     
     s) 
     
      exit 0 ;;
    
    *) 
       printf "ohhhh!!! Selecciona unba opcion del menu :)";
       printf "Presiona una tecla...";
    read;;
    
    esac
done
