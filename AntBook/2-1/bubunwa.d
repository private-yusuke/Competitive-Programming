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

int n, k;
int[] a;
void main() {
	n = ri;
	a = readAs!(int[]);
	k = ri;

	(dfs(0, 0) ? "Yes" : "No").writeln;
}

bool dfs(int i, int sum) {
	if(i == n) return sum == k; // すべて選んだ後に合計がkか否か
	if(dfs(i + 1, sum)) return true;
	if(dfs(i + 1, sum + a[i])) return true;
	return false;
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