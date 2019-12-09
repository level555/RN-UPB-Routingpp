//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
// 
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Lesser General Public License for more details.
// 
// You should have received a copy of the GNU Lesser General Public License
// along with this program.  If not, see http://www.gnu.org/licenses/.
// 

package inet.bgpsimulation;

import inet.networklayer.configurator.ipv4.Ipv4NetworkConfigurator;
import inet.node.bgp.BgpRouter;
import inet.node.ethernet.Eth100M;
import inet.node.inet.Router;
import inet.node.inet.StandardHost;
import inet.visualizer.integrated.IntegratedCanvasVisualizer;

network BgpSimulationTopology
{
    submodules:
        configurator: Ipv4NetworkConfigurator {
            @display("p=118,26");
        }

        visualizer: IntegratedCanvasVisualizer {

            @display("p=44,26");
        }
        // 9 hosts
        host0: StandardHost {

            @display("p=587,169");
        }

        host1: StandardHost {

            @display("p=651,231");
        }

        host2: StandardHost {

            @display("p=593,275");
        }
        host3: StandardHost {

            @display("p=118,231");
        }

        host4: StandardHost {

            @display("p=172,169");
        }

        host5: StandardHost {

            @display("p=172,275");
        }

        host6: StandardHost {

            @display("p=315,98");
        }

        host7: StandardHost {

            @display("p=447,92");
        }

        host8: StandardHost {

            @display("p=381,36");
        }

        //3 bgp router

        bgprouter0: BgpRouter {
            @display("p=486,231");
        }
        bgprouter1: BgpRouter {
            @display("p=276,231");
        }
        bgprouter2: BgpRouter {
            @display("p=381,173");
        }

        //3 router for internal routing in autonomous systems
        // don't know if it works like this
        internalrouter0: Router {

            @display("p=579,231");
        }
        internalrouter1: Router {

            @display("p=186,231");
        }
        internalrouter2: Router {

            @display("p=381,108");
        }
        
        connections:
            host0.ethg++ <--> Eth100M <--> internalrouter0.ethg++;
            host1.ethg++ <--> Eth100M <--> internalrouter0.ethg++;
            host2.ethg++ <--> Eth100M <--> internalrouter0.ethg++;
            host3.ethg++ <--> Eth100M <--> internalrouter1.ethg++;
            host4.ethg++ <--> Eth100M <--> internalrouter1.ethg++;
            host5.ethg++ <--> Eth100M <--> internalrouter1.ethg++;
            host6.ethg++ <--> Eth100M <--> internalrouter2.ethg++;
            host7.ethg++ <--> Eth100M <--> internalrouter2.ethg++;
            host8.ethg++ <--> Eth100M <--> internalrouter2.ethg++;
            bgprouter0.ethg++ <--> Eth100M <--> internalrouter0.ethg++;
            bgprouter1.ethg++ <--> Eth100M <--> internalrouter1.ethg++;
            bgprouter2.ethg++ <--> Eth100M <--> internalrouter2.ethg++;
            bgprouter0.ethg++ <--> Eth100M <--> bgprouter1.ethg++;
            bgprouter0.ethg++ <--> Eth100M <--> bgprouter2.ethg++;
            bgprouter1.ethg++ <--> Eth100M <--> bgprouter2.ethg++;
            

}
