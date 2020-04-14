void main() {
	auto ip = rs.to!(dchar[]).map!(v => v - '0').array;
	char[][] calc;
	void gen(char[] arr, int n) {
		if(n == 3) {
			calc ~= arr;
		}
		else {
			gen(arr ~ '+', n+1);
			gen(arr ~ '-', n+1);
		}
	}
	gen([], 0);

	foreach(v; calc) {
		ulong ind;
		int tmp = ip[0];
		while(ind < 3) {
			switch(v[ind]) {
				case '+':
					tmp += ip[ind+1];
					break;
				case '-':
					tmp -= ip[ind+1];
					break;
				default: break;
			}
			ind++;
		}
		//tmp.writeln;
		if(tmp == 7) {
			"%d%s%d%s%d%s%d=7".writefln(ip[0], v[0], ip[1], v[1], ip[2], v[2], ip[3]);
			return;
		}
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

double rd() {
	return readAs!double;
}

string rs() {
	return readln.chomp;
}