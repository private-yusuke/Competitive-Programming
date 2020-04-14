void main() {
	auto N = rs;
	auto K = ri;
	
	while(N.length < 100) N = '0' ~ N;
	auto S = '0'.repeat(100).array;

	ulong res;
	foreach(i; 0..100) {
		for(S[i] = '1'; S[i] <= '9'; S[i]++) {
			if(K == 1 && S <= N) res++;
			foreach(j; 0..i) {
				for(S[j] = '1'; S[j] <= '9'; S[j]++) {
					if(K == 2 && S <= N) res++;
					foreach(k; 0..j) {
						for(S[k] = '1'; S[k] <= '9'; S[k]++) {
							if(K == 3 && S <= N) res++;
						}
						S[k] = '0';
					}
				}
				S[j] = '0';
			}
		}
		S[i] = '0';
	}
	res.writeln;
}

// ===================================

import std.stdio;
import std.string;
import std.functional;
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