#!/usr/bin/python


from scapy.all  import *

devices = set ()

def Mostrar(pak) :
	if pak.haslayer(Dot11Elt) :
	   pak2=pak.getlayer(Dot11Elt)
	   if pak.addr2 and pak.addr2 not in devices :
		devices.add(pak.addr2)
		print pak.addr2 ,pak2.info
			 
sniff(iface = 'mon0', count=100000 ,prn=Mostrar)
