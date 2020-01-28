package inet.scalableNetworks.bintree;

//option 1: BgpRouter
import inet.node.bgp.BgpRouter;
//option 2: BgpRouterSimple
import inet.shared.BGPRouterSimple;

import inet.common.misc.ThruputMeteringChannel;
import inet.networklayer.configurator.ipv4.Ipv4NetworkConfigurator;

network BinTree {
	parameters:
		int height = default(2);
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
//		node[2^height-1]: BgpRouter {
//		    parameters:
//		    	numPppInterfaces = 3;
//option 2: BgpRouterSimple
		node[2^height-1]: BGPRouterSimple {
		    gates:
		        pppg[3];
		}
      connections allowunconnected:
        for i=0..2^(height-1)-1, if 2*i+1 < 2^height-1 {
    	  node[i].pppg[1] <--> LINK_100 <--> node[2*i+1].pppg[0];
          node[i].pppg[2] <--> LINK_100 <--> node[2*i+2].pppg[0];
        }
}