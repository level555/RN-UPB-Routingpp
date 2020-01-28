package inet.scalableNetworks.clique;

//option 1: BgpRouter
import inet.node.bgp.BgpRouter;
//option 2: BgpRouterSimple
import inet.shared.BGPRouterSimple;

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
//option 1: BgpRouter
//		node[nodes]: BgpRouter {
//		    parameters:
//		    	numPppInterfaces = nodes;
//option 2: BgpRouterSimple
		node[nodes]: BGPRouterSimple {
		    gates:
		        pppg[nodes];
		}
	connections allowunconnected:
        for i=0..nodes-1, for j=i+1..nodes-1 {
    	  node[i].pppg[j] <--> LINK_100 <--> node[j].pppg[i];
        }
}