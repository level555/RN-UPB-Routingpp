package inet.europe;

import inet.common.misc.ThruputMeteringChannel;
import inet.networklayer.configurator.ipv4.Ipv4NetworkConfigurator;
import inet.visualizer.integrated.IntegratedCanvasVisualizer;

network BgpNetwork
{
    @display("bgb=4599.8877,2953.48");
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
                @display("p=2111.4238,870.334");
        }
        Duesseldorf: BGPRouterSimple {
            parameters:
                @display("p=1803.5079,776.074");
        }
        London: BGPRouterSimple {
            parameters:
                @display("p=722.66,826.346");
        }
        Manchester: BGPRouterSimple {
            parameters:
                @display("p=782.358,417.886");
        }
        Munich: BGPRouterSimple {
            parameters:
                @display("p=2438.192,1611.846");
        }
        Amsterdam: BGPRouterSimple {
            parameters:
                @display("p=1256.7999,458.732");
        }
        Luxembourg: BGPRouterSimple {
            parameters:
                @display("p=1545.864,945.742");
        }
        Paris: BGPRouterSimple {
            parameters:
                @display("p=1109.126,1153.114");
        }
        Prague: BGPRouterSimple {
            parameters:
                @display("p=2771.244,1215.954");
        }
        Copenhagen: BGPRouterSimple {
            parameters:
                @display("p=1913.4779,339.336");
        }
        Stockholm: BGPRouterSimple {
            parameters:
                @display("p=2045.4419,182.236");
        }
        Warsaw: BGPRouterSimple {
            parameters:
                @display("p=3478.1938,791.784");
        }
        Bucharest: BGPRouterSimple {
            parameters:
                @display("p=3952.636,1171.966");
        }
        Zurich: BGPRouterSimple {
            parameters:
                @display("p=1787.798,1256.7999");
        }
        Brussels: BGPRouterSimple {
            parameters:
                @display("p=1391.906,870.334");
        }
        Vienna: BGPRouterSimple {
            parameters:
                @display("p=2513.5999,1369.912");
        }
        hamburg: BGPRouterSimple {
            parameters:
                @display("p=1636.9819,515.28796");
        }
        Berlin: BGPRouterSimple {
            parameters:
                @display("p=2290.5178,691.24");
        }
        Oslo: BGPRouterSimple {
            parameters:
                @display("p=1731.242,103.686");
        }
        Dublin: BGPRouterSimple {
            parameters:
                @display("p=534.14,543.566");
        }
        Geneva: BGPRouterSimple {
            parameters:
                @display("p=1523.87,1417.042");
        }
        Budapest: BGPRouterSimple {
            parameters:
                @display("p=3559.886,1137.4039");
        }
        Zagreb: BGPRouterSimple {
            parameters:
                @display("p=3547.3179,1486.166");
        }
        Sofia: BGPRouterSimple {
            parameters:
                @display("p=3958.92,1580.4259");
        }
        Belgrade: BGPRouterSimple {
            parameters:
                @display("p=3804.962,1325.924");
        }
        Kiev: BGPRouterSimple {
            parameters:
                @display("p=3852.0918,845.198");
        }
        Vilnius: BGPRouterSimple {
            parameters:
                @display("p=3424.78,644.11");
        }
        Riga: BGPRouterSimple {
            parameters:
                @display("p=3226.834,543.566");
        }
        Tallin: BGPRouterSimple {
            parameters:
                @display("p=3154.5679,383.324");
        }
        helsinki: BGPRouterSimple {
            parameters:
                @display("p=3220.5498,197.946");
        }
        Lyon: BGPRouterSimple {
            parameters:
                @display("p=1351.0599,1696.6799");
        }
        Marseille: BGPRouterSimple {
            parameters:
                @display("p=1159.398,1998.3119");
        }
        Barcelona: BGPRouterSimple {
            parameters:
                @display("p=926.88995,2211.968");
        }
        Madrid: BGPRouterSimple {
            parameters:
                @display("p=540.424,2284.234");
        }
        Lisbon: BGPRouterSimple {
            parameters:
                @display("p=191.662,2431.908");
        }
        Edinburgh: BGPRouterSimple {
            parameters:
                @display("p=728.944,87.976");
        }
        Leeds: BGPRouterSimple {
            parameters:
                @display("p=1021.14996,251.36");
        }
        Bratislava: BGPRouterSimple {
            parameters:
                @display("p=3299.0999,970.878");
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

        Oslo.pppg++ <--> LINK_100 <--> Copenhagen.pppg++;
        Oslo.pppg++ <--> LINK_100 <--> Stockholm.pppg++;

        Stockholm.pppg++ <--> LINK_100 <--> Copenhagen.pppg++;
        Stockholm.pppg++ <--> LINK_100 <--> Berlin.pppg++;

        Dublin.pppg++ <--> LINK_100 <--> London.pppg++;
        Dublin.pppg++ <--> LINK_100 <--> Manchester.pppg++;

        Manchester.pppg++ <--> LINK_100 <--> Amsterdam.pppg++;

        Vienna.pppg++ <--> LINK_100 <--> Warsaw.pppg++;

        Zurich.pppg++ <--> LINK_100 <--> Geneva.pppg++;

        Budapest.pppg++ <--> LINK_100 <--> Vienna.pppg++;

        Zagreb.pppg++ <--> LINK_100 <--> Vienna.pppg++;

        Sofia.pppg++ <--> LINK_100 <--> Zagreb.pppg++;

        Belgrade.pppg++ <--> LINK_100 <--> Sofia.pppg++;
        Belgrade.pppg++ <--> LINK_100 <--> Bucharest.pppg++;
        Belgrade.pppg++ <--> LINK_100 <--> Budapest.pppg++;

        Budapest.pppg++ <--> LINK_100 <--> Bucharest.pppg++;

        Kiev.pppg++ <--> LINK_100 <--> Vienna.pppg++;
        Kiev.pppg++ <--> LINK_100 <--> Warsaw.pppg++;

        Vilnius.pppg++ <--> LINK_100 <--> Warsaw.pppg++;

        Riga.pppg++ <--> LINK_100 <--> Vilnius.pppg++;

        Tallin.pppg++ <--> LINK_100 <--> Riga.pppg++;

        helsinki.pppg++ <--> LINK_100 <--> Tallin.pppg++;
        helsinki.pppg++ <--> LINK_100 <--> Stockholm.pppg++;

        Tallin.pppg++ <--> LINK_100 <--> Stockholm.pppg++;

        Lyon.pppg++ <--> LINK_100 <--> Geneva.pppg++;

        Marseille.pppg++ <--> LINK_100 <--> Lyon.pppg++;
        Marseille.pppg++ <--> LINK_100 <--> Paris.pppg++;

        Barcelona.pppg++ <--> LINK_100 <--> Marseille.pppg++;

        Madrid.pppg++ <--> LINK_100 <--> Barcelona.pppg++;

        Lisbon.pppg++ <--> LINK_100 <--> Madrid.pppg++;

        Madrid.pppg++ <--> LINK_100 <--> Paris.pppg++;

        Edinburgh.pppg++ <--> LINK_100 <--> Manchester.pppg++;

        Leeds.pppg++ <--> LINK_100 <--> Manchester.pppg++;

		Bratislava.pppg++ <--> LINK_100 <--> Vienna.pppg++;

}

