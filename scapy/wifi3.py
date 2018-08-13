#!/usr/bin/python
import sys
from scapy.all import *

devices = set()

def PacketHandler(pak) :
	
	if pak.haslayer(Dot11) :
		if len(pak.info) > 0 :
			dot11_layer = pak.getlayer(Dot11)
			if dot11_layer.addr2 and (dot11_layer.addr2 not in devices) :
			#if dot11_layer.info <> ''  :
				devices.add(dot11_layer.addr2)
				print len(devices), dot11_layer.addr2, dot11_layer.info

sniff(iface = sys.argv[1],count = int(sys.argv[2]),prn=PacketHandler)
