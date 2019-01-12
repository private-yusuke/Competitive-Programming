void main() {
	auto T = ri;
	foreach(_; 0..T) {
		auto ip = readAs!(ulong[]), A = ip[0], B = ip[1], C = ip[2], D = ip[3];
		long sec, thi, fou, old = A, now, i = 2;
		sec = now = A - B;
		if(now < 0) {
			writeln("No");
			continue;
		}
		while(true) {
			writeln(old, " ", now);
			old = now;
			if(now <= C) now += D;

			switch(i) {
				case 2:
					thi = now;
					break;
				case 3:
					fou = now;
					break;
				default: break;
			}
			debug writefln("1: %d, 2: %d, 3: %d, 4: %d, old, %d, now: %d", A, sec, thi, fou, old, now);

			if(now < B) {
				writeln("No");
				break;
			} else now -= B;
			if(i > 5) {
				if((old == A && now == sec) || (old == sec && now == thi) || (old == thi && now == fou)) {
					writeln("Yes");
					break;
				}
			}
			i++;
		}
	}
}

// ===================================

import std.stdio;
import std.string;
import std.functional;
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