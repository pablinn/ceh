#!/usr/bin/python

from scapy.all import *


#broadcast a mi red

a=IP(src="192.168.0.137",dst="192.168.0.255")
b=a/ICMP()/"Hola Mundo"
output=sr(b)

result, unanswered=output

print '\n La respuesta es: ' + output
print '\n La respuesta es: ' + result 
