import std.stdio;
import std.string;
import std.conv;
import std.algorithm;
import std.range;
import std.traits;
import std.math;
import std.conv;
import std.typecons;

int[][] dp;
int A, B;
int[] a, b;

void main() {
	auto ip = readAs!(int[]);
	A = ip[0];
	B = ip[1];
	a = readAs!(int[]);
	b = readAs!(int[]);
	dp = new int[][](A + 1, B + 1);
	dp[A][B] = 0;
	foreach(i; 0..A+1) fill(dp[i], -1);

	rec(0, 0).writeln; // 0, 0個以降
}

int rec(int i, int j) {
	if(i == 0 && j == 0) return 0;
	if(dp[i][j] != -1) return dp[i][j];

	if((i + j) % 2 == 0) {
		//sumeke
	} else {
		//suruke
	}
	return 0;
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