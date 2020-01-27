package inet.BgpOpen;

import inet.common.misc.ThruputMeteringChannel;
import inet.networklayer.configurator.ipv4.Ipv4NetworkConfigurator;
import inet.visualizer.integrated.IntegratedCanvasVisualizer;

network BgpNetwork
{
    @display("bgb=1383,1065");
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
        visualizer: IntegratedCanvasVisualizer {
            parameters:
                @display("p=61,189;is=s");
        }
        configurator: Ipv4NetworkConfigurator {
            parameters:
                @display("p=58,121;is=s");
                config = xmldoc("IPv4Config.xml");
                addStaticRoutes = false;
                addDefaultRoutes = false;
                addSubnetRoutes = false;
        }
        Frankfurt: BGPRouterSimple {
            parameters:
                @display("p=520,545");
        }
        Duesseldorf: BGPRouterSimple {
            parameters:
                @display("p=723,411");
        }
        London: BGPRouterSimple {
            parameters:
                @display("p=247,294");
        }
        Manchester: BGPRouterSimple {
            parameters:
                @display("p=183,231");
        }
        Munich: BGPRouterSimple {
            parameters:
                @display("p=638,768");
        }
        Amsterdam: BGPRouterSimple {
            parameters:
                @display("p=389,262");
        }
        Luxembourg: BGPRouterSimple {
            parameters:
                @display("p=394,494");
        }
        Paris: BGPRouterSimple {
            parameters:
                @display("p=211,620");
        }
        Prague: BGPRouterSimple {
            parameters:
                @display("p=1014,563");
        }
        Copenhagen: BGPRouterSimple {
            parameters:
                @display("p=683,211");
        }
        Stockholm: BGPRouterSimple {
            parameters:
                @display("p=603,60");
        }
        Warsaw: BGPRouterSimple {
            parameters:
                @display("p=945,388");
        }
        Bucharest: BGPRouterSimple {
            parameters:
                @display("p=1219,695");
        }
        Zurich: BGPRouterSimple {
            parameters:
                @display("p=494,813");
        }
        Brussels: BGPRouterSimple {
            parameters:
                @display("p=410,401");
        }
        Vienna: BGPRouterSimple {
            parameters:
                @display("p=725,645");
        }
        hamburg: BGPRouterSimple {
            parameters:
                @display("p=490,224");
        }
        Berlin: BGPRouterSimple {
            parameters:
                @display("p=667,323");
        }

    connections:
        Frankfurt.pppg++ <--> LINK_100 <--> Duesseldorf.pppg++;
        Duesseldorf.pppg++ <--> LINK_100 <--> London.pppg++;
        London.pppg++ <--> LINK_100 <--> Manchester.pppg++;
        Amsterdam.pppg++ <--> LINK_100 <--> Duesseldorf.pppg++;
        Munich.pppg++ <--> LINK_100 <--> Frankfurt.pppg++;
        Luxembourg.pppg++ <--> LINK_100 <--> Frankfurt.pppg++;
        Paris.pppg++ <--> LINK_100 <--> Frankfurt.pppg++;

        Frankfurt.pppg++ <--> LINK_100 <--> Amsterdam.pppg++;
        Frankfurt.pppg++ <--> LINK_100 <--> Prague.pppg++;
        Frankfurt.pppg++ <--> LINK_100 <--> Copenhagen.pppg++;
        Frankfurt.pppg++ <--> LINK_100 <--> Stockholm.pppg++;
        Frankfurt.pppg++ <--> LINK_100 <--> Warsaw.pppg++;
        Frankfurt.pppg++ <--> LINK_100 <--> Bucharest.pppg++;
        Frankfurt.pppg++ <--> LINK_100 <--> Zurich.pppg++;

        Duesseldorf.pppg++ <--> LINK_100 <--> Prague.pppg++;

        Luxembourg.pppg++ <--> LINK_100 <--> Brussels.pppg++;

        Brussels.pppg++ <--> LINK_100 <--> Amsterdam.pppg++;

        Paris.pppg++ <--> LINK_100 <--> London.pppg++;
        Paris.pppg++ <--> LINK_100 <--> Vienna.pppg++;
        Paris.pppg++ <--> LINK_100 <--> Zurich.pppg++;
        Paris.pppg++ <--> LINK_100 <--> Brussels.pppg++;
        Paris.pppg++ <--> LINK_100 <--> Amsterdam.pppg++;

        London.pppg++ <--> LINK_100 <--> Amsterdam.pppg++;

        Amsterdam.pppg++ <--> LINK_100 <--> hamburg.pppg++;
        hamburg.pppg++ <--> LINK_100 <--> Copenhagen.pppg++;
        hamburg.pppg++ <--> LINK_100 <--> Berlin.pppg++;

        Amsterdam.pppg++ <--> LINK_100 <--> Berlin.pppg++;
        Amsterdam.pppg++ <--> LINK_100 <--> Stockholm.pppg++;

        Berlin.pppg++ <--> LINK_100 <--> Munich.pppg++;
        Berlin.pppg++ <--> LINK_100 <--> Warsaw.pppg++;
        Berlin.pppg++ <--> LINK_100 <--> Prague.pppg++;

        Prague.pppg++ <--> LINK_100 <--> Vienna.pppg++;


}

