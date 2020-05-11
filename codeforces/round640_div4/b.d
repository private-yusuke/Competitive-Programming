void main() {
	auto t = ri;
	foreach(T; 0..t) {
		auto ip = readAs!(int[]), n = ip[0], k = ip[1];
		int[] list;
		if(n < k) {
			writeln("NO");
			continue;
		}
		if(n == k) {
			writeln("YES");
			writefln("%(%d %)", 1.repeat(k).array);
			continue;
		}
		if(n % 2 == 0) {
			if(k % 2 == 0) {
				if(n >= 2*k) {
					list ~= 2.repeat(k-1).array;
					list ~= n - 2 * (k-1);
				} else {
					writeln("NO");
					continue;
				}
			} else {
				if(n >= 2*k) {
					list ~= 2.repeat(k-1).array;
					list ~= n - 2 * (k-1);
				} else {
					writeln("NO");
					continue;
				}
			}
		} else {
			if(k % 2 == 0) {
				writeln("NO");
				continue;
			} else {
				list ~= 1.repeat(k - 1).array;
				list ~= n - (k - 1);
			}
		}
		writeln("YES");
		writefln("%(%d %)", list);
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