package inet.scalableNetworks.clique;

simple TTNode
{
    gates:
        input in[];
        output out[];
}

network Clique {
	parameters:
		int nodes = default(2);
	submodules:
		node[nodes]: TTNode {
		    gates:
		        in[nodes];
		        out[nodes];
		}
      connections allowunconnected:
        for i=0..nodes-1, for j=i+1..nodes-1 {
    	  node[i].out[j] --> node[j].in[i];
          node[i].in[j] <-- node[j].out[i];
        }
}