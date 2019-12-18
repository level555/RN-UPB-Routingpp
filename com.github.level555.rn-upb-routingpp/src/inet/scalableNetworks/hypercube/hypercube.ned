package inet.scalableNetworks.hypercube;

simple TTNode
{
    gates:
        input in[];
        output out[];
}

network Hypercube {
	parameters:
		int dim = default(2);
	submodules:
		node[2^dim]: TTNode {
			gates:
				in[dim];
        		out[dim]; 
		}
	connections allowunconnected:
		for i=0..2^dim-1, for j=0..dim-1 {
			node[i].out[j] --> node[i # 2^j].in[j];
		}
}