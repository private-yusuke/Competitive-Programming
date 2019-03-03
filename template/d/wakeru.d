int[][] wakeru(int[] arr, ulong n) {
	int[][] res;
	foreach(i; 0..arr.length / n) {
		res ~= arr[i*n..(i+1)*n];
	}
	return res;
}
