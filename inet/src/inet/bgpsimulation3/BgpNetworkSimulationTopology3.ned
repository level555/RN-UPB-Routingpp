package inet.bgpsimulation3;

import inet.common.misc.ThruputMeteringChannel;
import inet.networklayer.configurator.ipv4.Ipv4NetworkConfigurator;
import inet.node.ethernet.EtherSwitch;
import inet.node.inet.StandardHost;
import inet.node.ospfv2.OspfRouter;
import inet.visualizer.integrated.IntegratedCanvasVisualizer;
import inet.bgpsimulation3.myBgpRouter;

network BgpNetworkSimulationTopology3
{
    types:
        
        channel LINK_1G extends ThruputMeteringChannel
        {
            parameters:
                delay = 50us;
                datarate = 1000Mbps;
                displayAsTooltip = true;
                thruputDisplayFormat = "#N";
        }
        
        channel FIBRE_4G extends ThruputMeteringChannel
        {
            parameters:
                delay = 50us;
                datarate = 4000Mbps;
                displayAsTooltip = true;
                thruputDisplayFormat = "#N";
        }
        
    submodules:
        visualizer: IntegratedCanvasVisualizer {
            parameters:
                @display("p=100,100;is=s");
        }
        configurator: Ipv4NetworkConfigurator {
            parameters:
                @display("p=100,200;is=s");
                config = xmldoc("IPv4Config.xml");
                addStaticRoutes = false;
                addDefaultRoutes = false;
                addSubnetRoutes = false;
        }
        A1: myBgpRouter {
            parameters:
                @display("p=696,307");
            gates:
                pppg[2];
        }
        A2: myBgpRouter {
            parameters:
                @display("p=848,311");
            gates:
                pppg[2];
        }
        B: myBgpRouter {
            parameters:
                @display("p=700,130");
            gates:
                pppg[3];
        }
        C: myBgpRouter {
            parameters:
                @display("p=850,130");
            gates:
                pppg[4];
        }
        RA1: OspfRouter {
            parameters:
                @display("p=696,455;i=device/router");
            gates:
                pppg[3];
        }
        RA2: OspfRouter {
            parameters:
                @display("p=846,455;i=device/router");
            gates:
                pppg[3];
        }
        RA3: OspfRouter {
            parameters:
                @display("p=771,555;i=device/router");
            gates:
                pppg[2];
                ethg[1];
        }
        RB1: OspfRouter {
            parameters:
                @display("p=491,133;i=device/router");
            gates:
                pppg[1];
                ethg[1];
        }
        RC1: OspfRouter {
            parameters:
                @display("p=1112,138;i=device/router");
            gates:
                pppg[2];
                ethg[1];
        }
        RC2: OspfRouter {
            parameters:
                @display("p=1112,338;i=device/router");
            gates:
                pppg[2];
                ethg[1];
        }
        PA3: EtherSwitch {
            parameters:
                @display("p=771,655;i=device/switch");
            gates:
                ethg[3];
        }
        PB1: EtherSwitch {
            parameters:
                @display("p=341,133;i=device/switch");
            gates:
                ethg[3];
        }
        PC1: EtherSwitch {
            parameters:
                @display("p=1262,138;i=device/switch");
            gates:
                ethg[3];
        }
        PC2: EtherSwitch {
            parameters:
                @display("p=1262,338;i=device/switch");
            gates:
                ethg[3];
        }
        HA31: StandardHost {
            parameters:
                @display("p=696,755;i=device/pc");
            gates:
                ethg[1];
        }
        HA32: StandardHost {
            parameters:
                @display("p=846,755;i=device/pc");
            gates:
                ethg[1];
        }
        HB11: StandardHost {
            parameters:
                @display("p=191,83;i=device/pc");
            gates:
                ethg[1];
        }
        HB12: StandardHost {
            parameters:
                @display("p=191,183;i=device/pc");
            gates:
                ethg[1];
        }
        HC11: StandardHost {
            parameters:
                @display("p=1412,88;i=device/pc");
            gates:
                ethg[1];
        }
        HC12: StandardHost {
            parameters:
                @display("p=1412,188;i=device/pc");
            gates:
                ethg[1];
        }
        HC21: StandardHost {
            parameters:
                @display("p=1412,288;i=device/pc");
            gates:
                ethg[1];
        }
        HC22: StandardHost {
            parameters:
                @display("p=1412,388;i=device/pc");
            gates:
                ethg[1];
        }
    connections:
        //LAN RA3
        HA31.ethg[0] <--> LINK_1G <--> PA3.ethg[0];
        HA32.ethg[0] <--> LINK_1G <--> PA3.ethg[1];
        PA3.ethg[2] <--> LINK_1G <--> RA3.ethg[0];

        //LAN RB1
        HB11.ethg[0] <--> LINK_1G <--> PB1.ethg[0];
        HB12.ethg[0] <--> LINK_1G <--> PB1.ethg[1];
        PB1.ethg[2] <--> LINK_1G <--> RB1.ethg[0];

        //LAN C1 et C2
        HC11.ethg[0] <--> LINK_1G <--> PC1.ethg[0];
        HC12.ethg[0] <--> LINK_1G <--> PC1.ethg[1];
        HC21.ethg[0] <--> LINK_1G <--> PC2.ethg[0];
        HC22.ethg[0] <--> LINK_1G <--> PC2.ethg[1];
        PC1.ethg[2] <--> LINK_1G <--> RC1.ethg[0];
        PC2.ethg[2] <--> LINK_1G <--> RC2.ethg[0];

        //OSPF A
        RA1.pppg[2] <--> LINK_1G <--> RA3.pppg[0];
        RA2.pppg[2] <--> LINK_1G <--> RA3.pppg[1];
        RA1.pppg[1] <--> LINK_1G <--> RA2.pppg[1];
        RA1.pppg[0] <--> LINK_1G <--> A1.pppg[1];
        RA2.pppg[0] <--> LINK_1G <--> A2.pppg[1];

        //OSPF B
        RB1.pppg[0] <--> LINK_1G <--> B.pppg[1];

        //OSPF C
        RC1.pppg[1] <--> LINK_1G <--> RC2.pppg[1];
        RC1.pppg[0] <--> LINK_1G <--> C.pppg[1];
        RC2.pppg[0] <--> LINK_1G <--> C.pppg[2];

        //BGP
        A1.pppg[0] <--> FIBRE_4G <--> B.pppg[0];
        A2.pppg[0] <--> FIBRE_4G <--> C.pppg[0];
        B.pppg[2] <--> FIBRE_4G <--> C.pppg[3];
}

