package inet.BgpOpen;

import inet.common.misc.ThruputMeteringChannel;
import inet.networklayer.configurator.ipv4.Ipv4NetworkConfigurator;
import inet.visualizer.integrated.IntegratedCanvasVisualizer;

network BgpNetwork
{
    @display("bgb=2262.004,1567.1539");
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
                @display("p=900.09796,1244.3159");
        }
        Amsterdam: BGPRouterSimple {
            parameters:
                @display("p=384,239");
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
                @display("p=1233.626,848.786");
        }
        Copenhagen: BGPRouterSimple {
            parameters:
                @display("p=626,203");
        }
        Stockholm: BGPRouterSimple {
            parameters:
                @display("p=762,89");
        }
        Warsaw: BGPRouterSimple {
            parameters:
                @display("p=1599.224,577.26");
        }
        Bucharest: BGPRouterSimple {
            parameters:
                @display("p=2071.722,957.824");
        }
        Zurich: BGPRouterSimple {
            parameters:
                @display("p=456,711");
        }
        Brussels: BGPRouterSimple {
            parameters:
                @display("p=410,401");
        }
        Vienna: BGPRouterSimple {
            parameters:
                @display("p=974.928,1004.86");
        }
        hamburg: BGPRouterSimple {
            parameters:
                @display("p=490,224");
        }
        Berlin: BGPRouterSimple {
            parameters:
                @display("p=755,297");
        }
        Oslo: BGPRouterSimple {
            parameters:
                @display("p=571,65");
        }
        Dublin: BGPRouterSimple {
            parameters:
                @display("p=258,113");
        }
        Geneva: BGPRouterSimple {
            parameters:
                @display("p=358,782");
        }
        Budapest: BGPRouterSimple {
            parameters:
                @display("p=1678.33,921.47797");
        }
        Zagreb: BGPRouterSimple {
            parameters:
                @display("p=1667.64,1269.9719");
        }
        Sofia: BGPRouterSimple {
            parameters:
                @display("p=2078.136,1366.182");
        }
        Belgrade: BGPRouterSimple {
            parameters:
                @display("p=1924.2,1111.76");
        }
        Kiev: BGPRouterSimple {
            parameters:
                @display("p=1971.236,630.70996");
        }
        Vilnius: BGPRouterSimple {
            parameters:
                @display("p=1545.7739,429.738");
        }
        Riga: BGPRouterSimple {
            parameters:
                @display("p=1344.802,329.25198");
        }
        Tallin: BGPRouterSimple {
            parameters:
                @display("p=1560.74,213.8");
        }
        helsinki: BGPRouterSimple {
            parameters:
                @display("p=1319.146,100.486");
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

}

