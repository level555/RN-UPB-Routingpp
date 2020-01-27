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
	ipTemp = currentConnection % 254
	ipOffset = int(currentConnection / 254) + 10
	if ipOffset > 254:
		print("Warning, invalid ip")
	fromIp = "10." + str(ipOffset) + "." + str(ipTemp) + "." + str(toIndex + 1)
	toIp = "10." + str(ipOffset) + "." + str(ipTemp) + "." + str(fromIndex + 1)
	name = str(fromIndex) + "." + str(fromGate) + "<-->" + str(toIndex) + "." + str(toGate)
	ipConfig += "	<interface hosts='node[" + str(fromIndex) + "]' names='ppp" + str(fromGate) + "' address='" + fromIp + "' netmask='255.255.255.0' />\n"
	ipConfig += "	<interface hosts='node[" + str(toIndex) + "]' names='ppp" + str(toGate) + "' address='" + toIp + "' netmask='255.255.255.0' />\n"
	if not fromIndex in bgpAdded:
		bgpAdded.append(fromIndex)
		addRouter_bgpConfig(len(bgpAdded), fromIp, name)
	if not toIndex in bgpAdded:
		bgpAdded.append(toIndex)
		addRouter_bgpConfig(len(bgpAdded), toIp, name)
	
	addRouter_Session(fromIp, toIp, name)
	return fromIp

def addRouter_bgpConfig(currentConnection, ip, name):
	global bgpConfig
	bgpConfig += "	<AS id='" + str(currentConnection) + "'> <!-- " + name + " -->\n"
	bgpConfig += "		<Router interAddr='" + ip + "'/>\n"
	bgpConfig += "	</AS>\n"

def addRouter_Connection(fromIndex, fromGate, toIndex, toGate):
	global connectionConfig
	connectionConfig += "		node[" + str(fromIndex) + "].pppg[" + str(fromGate) + "]" + " <--> " + linkName + " <--> node[" + str(toIndex) + "].pppg[" + str(fromGate) + "]\n"

def addRouter_Submodul(index, max):
	global submodulConfig
	submodulConfig += "		R" + str(index) + "]: BgpRouter {\n"
	submodulConfig += "			parameters:\n"
	submodulConfig += "				numPppInterfaces = " + str(max) + ";\n"
	submodulConfig += "		}\n"

for i in range(0, n):
	addRouter_Submodul(i, n)
	if n == 1:
		print("no route")
	for j in range(i+1, n):
		#print(str(i) + "." + str(j) + " <--> " + str(j) + "." + str(i))
		currentConnection+=1
		addRouter_Connection(i, j, j, i)
		addRouter_ipConfig(i, j, j, i, currentConnection)
	

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
