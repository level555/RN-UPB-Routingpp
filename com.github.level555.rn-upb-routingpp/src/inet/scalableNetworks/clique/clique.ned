package inet.scalableNetworks.clique;

import inet.node.bgp.BgpRouter;
import inet.common.misc.ThruputMeteringChannel;
import inet.networklayer.configurator.ipv4.Ipv4NetworkConfigurator;

network Clique {
	parameters:
		int nodes = default(2);
	types:
        channel LINK_100 extends ThruputMeteringChannel
        {
            parameters:
                delay = 50us;
                datarate = 100Mbps;
                displayAsTooltip = true;
                thruputDisplayFormat = "#N";
        }
	submodules:
	    configurator: Ipv4NetworkConfigurator {
            parameters:
                @display("p=100,200;is=s");
                addStaticRoutes = false;
                addDefaultRoutes = false;
                addSubnetRoutes = false;
        }
		node[nodes]: BgpRouter {
		    parameters:
		    	numPppInterfaces = nodes;
//		    gates:
//		        pppg[nodes];
		}
	connections allowunconnected:
        for i=0..nodes-1, for j=i+1..nodes-1 {
    	  node[i].pppg[j] <--> LINK_100 <--> node[j].pppg[i];
        }
}