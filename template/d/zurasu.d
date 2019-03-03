int[][] zurasu(int[] arr, ulong n) {
	typeof(return) res;
	foreach(i; 0..max(0, arr.length.to!int-n+1)) {
		res ~= arr[i..i+n];
	}
	return res;
}
