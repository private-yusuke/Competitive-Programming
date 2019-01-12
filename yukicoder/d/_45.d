import std.stdio;
import std.string;
import std.conv;
import std.algorithm;
import std.range;
import std.traits;
import std.math;
import std.conv;
import std.typecons;
import std.uni;
import std.ascii;
import std.bitmanip;
import core.bitop;

int N;
int[] dp;
int[] V;
void main() {
	N = ri;
	V = readAs!(int[]) ~ 0;
	dp = new int[](N + 1);
	dp[] = -1;
	dp[0] = V[0]; // 0個目
	dp[1] = max(dp[0], V[1]);

	foreach(i; 2..N) {
		dp[i] = max(dp[i-1], dp[i-2] + V[i]);
	}
	dp[N-1].writeln;
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

double rd() {
	return readAs!double;
}

string rs() {
	return readln.chomp;
}