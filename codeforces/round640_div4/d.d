void main() {
	auto t = ri;
	foreach(T; 0..t) {
		auto n = ri;
		auto a = readAs!(int[]);
		int last;
		bool[] visited = new bool[](n);
		long alice, bob;
		long lalice, lbob;
		uint pa, pb = n - 1;
		ulong move;
		ulong k;
		loop: foreach(i; 0..10000) {
			bool flag = false;
			debug visited.map!(v => v+0).writeln;
			debug writefln("%d %d", pa, pb);
			if(i % 2 == 0) {
				lalice = 0;
				while(lalice <= lbob) {
					if(pa < n && !visited[pa]) {
						if(!flag) { flag = true; k++; }
						visited[pa] = true;
						alice += a[pa];
						lalice += a[pa];
						pa++;
					} else break loop;
				}
			} else {
				lbob = 0;
				while(lbob <= lalice) {
					if(pb > 0 && !visited[pb]) {
						if(!flag) { flag = true; k++; }
						visited[pb] = true;
						bob += a[pb];
						lbob += a[pb];
						pb--;
					} else break loop;
				}
			}
		}
		writefln("%d %d %d", k, alice, bob);
	}
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

long rl() {
	return readAs!long;
}

double rd() {
	return readAs!double;
}

string rs() {
	return readln.chomp;
}