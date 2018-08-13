#!/usr/bin/python
import sys
from scapy.all import *

devices = set()

def PacketHandler(pak) :
	if pak.haslayer(Dot11) :
		dot11_layer = pak.getlayer(Dot11)
		if dot11_layer.addr2 and (dot11_layer.addr2 not in devices) :
			devices.add(dot11_layer.addr2)
			print len(devices), dot11_layer.addr2, dot11_layer.payload.name

sniff(iface = sys.argv[1],count = int(sys.argv[2]),prn=PacketHandler)
