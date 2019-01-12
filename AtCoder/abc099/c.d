int[] arr;
void main() {
	arr ~= 1;
	arr ~= 6;
	arr ~= 9;
	foreach(i; [6, 9]) {
		int j = i;
		int k = 2;
		j = j ^^ 2;
		while(j <= 1e5) {
			arr ~= j;
			j = i ^^ k;
			k++;
		}
	}
	arr = arr.sort().uniq.array;
	debug arr.writeln;
	
	auto N = ri;
	dp = new int[](N+1);
	dp[] = -1;
	dp[0] = 0;
	solve(N).writeln;
}

int[] dp;

int solve(int i) {
	//i.writeln;
	if(dp[i] >= 0) return dp[i];
	int tmp = int.max;
	foreach(k; arr) {
		if(i < k) break;
		tmp = min(solve(i-k)+1, tmp);
	}
	return dp[i] = tmp;
}


// ===================================

import std.stdio;
import std.string;
import std.conv;
import std.algorithm;
import std.range;
import std.traits;
import std.math;
import std.container;
import std.bigint;
import std.numeric;
import std.conv;
import std.typecons;
import std.uni;
import std.ascii;
import std.bitmanip;
import core.bitop;

T readAs(T)() if (isBasicType!T) {
	return readln.chomp.to!T;
}
T readAs(T)() if (isArray!T) {
	return readln.split.to!T;
}

T[][] readMatrix(T)(uint height, uint width) if (!isSomeChar!T) {
	auto res = new T[][](height, width);
	foreach(i; 0..height) {
		res[i] = readAs!(T[]);
	}
	return res;
}

T[][] readMatrix(T)(uint height, uint width) if (isSomeChar!T) {
	auto res = new T[][](height, width);
	foreach(i; 0..height) {
		auto s = rs;
		foreach(j; 0..width) res[i][j] = s[j].to!T;
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