#!/usr/bin/python
import sys
from scapy.all import *

devices = set()

def PacketHandler(pak) :
	if pak.haslayer(Dot11ProbeReq) :
		if len(pak.info) > 0 :

		#dot11_layer = pak.getlayer(Dot11)
			if pak.addr2 and (pak.addr2 not in devices) :
				devices.add(pak.addr2)
				print len(devices), pak.addr2, pak.info, pak.name

sniff(iface = sys.argv[1],count = int(sys.argv[2]),prn=PacketHandler)
