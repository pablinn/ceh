#!/usr/bin/python

import logging
logging.getLogger("scapy.runtime").setLevel(logging.ERROR)
 
 
from scapy.all import *

#seq = x0  ack=o



#syn sec 0 ack 0 f S
a=IP(src='192.168.0.137',dst='217.128.188.179')


pkt1 = a/TCP(sport=25606,dport=502,seq=0,ack=0,flags='S')
r = sr1(pkt1)

#devuelve SYN-ACK

#ack sec 1  ack 1
pkt2 = a/TCP(sport=r.dport,dport=502,seq=r.ack,ack=r.seq + 1,flags='A')
r2 = sr1(pkt2)

#enviamos un PUSH+ACK

pkt3 = a/TCP(sport=r.dport,dport=502,seq=r.ack,ack=r.seq + 1,flags='PA')/"\x00\x01\x00\x00\x00\x06\x01\x03\x00\x00\x00\x05"
r3=sr1(pkt3)


#enviamos un ACK
#pkt4=a/TCP(sport=pkt1.sport,dport=502,seq=pkt3.ack,ack=pkt3.seq+7,flags='A')
#r=sr1(pkt4)	

