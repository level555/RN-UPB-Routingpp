package inet.scalableNetworks.bintree;

simple TTNode
{
    gates:
        input in[];
        output out[];
}

network BinTree {
	parameters:
		int height = default(2);
	submodules:
		node[2^height-1]: TTNode {
		    gates:
		        in[3];
		        out[3];
		}
      connections allowunconnected:
        for i=0..2^(height-1)-1, if 2*i+1 < 2^height-1 {
    	  node[i].out[1] --> node[2*i+1].in[0];
          node[i].in[1] <-- node[2*i+1].out[0];
          node[i].out[2] --> node[2*i+2].in[0];
          node[i].in[2] <-- node[2*i+2].out[0];
        }
}