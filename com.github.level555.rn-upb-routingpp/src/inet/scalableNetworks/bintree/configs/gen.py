import sys

linkName = "LINK_100"
n = int(sys.argv[1])


ipConfig = ""
bgpConfig = ""
connectionConfig = "	connections allowunconnected:\n"
submodulConfig = "	submodules:\n"
currentConnection = 0
bgpAdded = []
sessionCounter = 0

def addRouter_Session(fromIp, toIp, name):
	global bgpConfig
	global sessionCounter
	sessionCounter += 1
	bgpConfig += "	<Session id='" + str(sessionCounter) + "'> <!-- " + name + " -->\n"
	bgpConfig += "		<Router exterAddr='" + fromIp + "'/>\n"
	bgpConfig += "		<Router exterAddr='" + toIp + "'/>\n"
	bgpConfig += "	</Session>\n"

def addRouter_ipConfig(fromIndex, fromGate, toIndex, toGate, currentConnection):
	global ipConfig
	global bgpAdded
	
	# create ips
	ipTemp = currentConnection % 254
	ipOffset = int(currentConnection / 254) + 10
	if ipOffset > 254:
		print("Warning, invalid ip")
	fromIp = "10." + str(ipOffset) + "." + str(ipTemp) + "." + str(toIndex + 1)
	toIp = "10." + str(ipOffset) + "." + str(ipTemp) + "." + str(fromIndex + 1)
	
	# create name
	name = str(fromIndex) + "." + str(fromGate) + "<-->" + str(toIndex) + "." + str(toGate)
	
	# append 
	ipConfig += "	<interface hosts='node[" + str(fromIndex) + "]' names='ppp" + str(fromGate) + "' address='" + fromIp + "' netmask='255.255.255.0' /> <!-- " + name + " -->\n"
	ipConfig += "	<interface hosts='node[" + str(toIndex) + "]' names='ppp" + str(toGate) + "' address='" + toIp + "' netmask='255.255.255.0' /> <!-- " + name + " -->\n"
	
	# AS entry / Session entry needed?
	if not fromIndex in bgpAdded:
		bgpAdded.append(fromIndex)
		addRouter_bgpConfig(len(bgpAdded), fromIp, name)
	if not toIndex in bgpAdded:
		bgpAdded.append(toIndex)
		addRouter_bgpConfig(len(bgpAdded), toIp, name)
	
	addRouter_Session(fromIp, toIp, name)


def addRouter_bgpConfig(currentConnection, ip, name):
	global bgpConfig
	bgpConfig += "	<AS id='" + str(currentConnection) + "'> <!-- " + name + " -->\n"
	bgpConfig += "		<Router interAddr='" + ip + "'/>\n"
	bgpConfig += "	</AS>\n"

for i in range(0, 2 ** (n - 1) - 1):
	currentConnection+=1
	addRouter_ipConfig(i, 1, 2*i+1, 0, currentConnection)
	currentConnection+=1
	addRouter_ipConfig(i, 2, 2*i+2, 0, currentConnection)


f = open("ip.txt","w+")
f.write(ipConfig)
f.close()


f = open("bgp.txt","w+")
f.write(bgpConfig)
f.close()

f = open("connections.txt","w+")
#f.write(connectionConfig)
f.close()

f = open("submoduls.txt","w+")
#f.write(submodulConfig)
f.close()
