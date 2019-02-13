void main() {
	auto ip = readAs!(ulong[]), K = ip[0], A = ip[1], B = ip[2];
	ulong res, bis, yen;
	bis = 1;
	if(A+1 < B) {
		if(K < A+1) {
			writeln(1+K);
			return;
		}
		K -= A-1;
		//K.writeln;
		yen++;
		bis = A;
		while(K != 0) {
			auto m = bis / A;
			//writefln("K: %d, m: %d, bis: %d", K, m, bis);
			if(K < 2*m) {
				bis += (K / 2) * B;
				bis -= (K / 2) * A;
				if(K % 2) bis++;
				bis.writeln;
				return;
			}
			K-=2*m;
			bis -= A*m;
			bis += m * B;
		}
		bis.writeln;
		return;
	} else {
		writeln(1+K);
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
