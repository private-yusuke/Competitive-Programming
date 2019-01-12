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

int[] dp;
void main() {
	auto N = ri;
	if(N == 1) {
		(-1).writeln;
		return;
	}
	generate_prime_list(N);
	dp = new int[](N + 1);
	dp[] = -1;
	foreach(i; 2..N) {
		if(prime_list.canFind(i)) dp[i] = 1;
	}
	solve(N).writeln;
	dp.writeln;
}

int solve(int i) {
	if(i == 2 || i == 3) return dp[i] = 1;
	int s = i;
	int k;
	foreach(p; prime_list) {
		if(p > i) break;
		k = min(k, solve(i - p));
	}
	return dp[i] = k;
}

int[] prime_list;

void generate_prime_list(int N) {
	prime_list = [2];
	bool not_prime = false;
	foreach(i; 3..N+1) {
		foreach(j; prime_list) {
			if(i % j == 0) {
				not_prime = true;
				break;
			}
		}
		if(!not_prime) prime_list ~= i;
		not_prime = false;
	}
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