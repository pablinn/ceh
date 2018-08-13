#!/usr/bin/python

from scapy.all import socket, StreamSocket, Raw
from modlib import *

import socket

sock = socket.socket()
sock.connect(("217.128.188.179", 502))
s = StreamSocket(sock, basecls=ModbusADU)

ans, unans = s.sr(ModbusADU()/ModbusPDU03())
ans.show()
