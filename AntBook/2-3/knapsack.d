import std.stdio;
import std.string;
import std.conv;
import std.algorithm;
import std.range;
import std.traits;
import std.math;
import std.conv;
import std.typecons;

int n;
int[] w, v;

void main() {
	/*auto n = ri();
	auto w = new uint[](n), v = new uint[](n);
	foreach(i; 0..n) {
		auto ip = readAs!(int[]);
		w[i] = ip[0];
		v[i] = ip[1];
	}
	auto W = ri();*/
	n = 4;
	w = [2, 1, 3, 2];
	v = [3, 2, 4, 2];
	int W = 5;
	dp = new int[][](n+1, W+1);
	foreach(i; 0..n+1) {
		dp[i][] = -1;
	}
	dp.writeln;
	// still not calculated
	rec(0, W).writeln;
	dp.writeln;
}

int[][] dp;
// i以降のものから重さの総和がj以下になるようにする
int rec(int i, int j) {
	if(dp[i][j] >= 0) return dp[i][j];
	"Entered: (%d, %d)".writefln(i, j);
	int res;
	if(i == n) {
		res = 0; // もう何も入らねーよ()
	}
	else if(j < w[i]) { // でかすぎ！！入りませんよ
		res = rec(i + 1, j);
	} else {
		// *ここで**これを*入れないのと入れるのではどっちが良い？？
		res = max(rec(i + 1, j), rec(i + 1, j - w[i]) + v[i]);
	}
	return dp[i][j] = res;
}

// ===================================

T readAs(T)() if (isBasicType!T) {
	return readln.chomp.to!T;
}
T readAs(T)() if (isArray!T) {
	return readln.split.to!T;
}

T[][] readMatrix(T)(uint height, uint width) if (isBasicType!T) {
	auto res = new T[][](height, width);
	foreach(i; 0..height) {
		res[i] = readAs!(T[]);
	}
	return res;
}

int ri() {
	return readAs!int;
}

string rs() {
	return readln.chomp;
}