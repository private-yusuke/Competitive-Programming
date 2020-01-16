alias Edge = Tuple!(long, "to", long, "cost");
long[] dijkstra(in Edge[][] tree, long start) {
	alias PriorityQueue = BinaryHeap;
 
	auto V = tree.length;
	auto dist = new long[V];
	fill(dist, 1L<<60);
 
	auto queue = new PriorityQueue!(Array!Edge, "a.cost >= b.cost")();
	dist[start] = 0;
	queue.insert(Edge(start, 0));
	while(!queue.empty) {
		auto p = queue.front();
		long v = p.to, cost = p.cost;
		queue.popFront();
		if(dist[v] < cost) continue;
		foreach(const ref Edge e; tree[v]) {
			if(dist[v] + e.cost < dist[e.to]) {
				dist[e.to] = dist[v] + e.cost;
				queue.insert(Edge(e.to, dist[e.to]));
			}
		}
	}
	return dist;
}