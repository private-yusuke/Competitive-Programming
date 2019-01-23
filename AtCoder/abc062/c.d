void main() {
	auto ip = readAs!(long[]), H = ip[0], W = ip[1];
	
	if(H % 3 == 0 || W % 3 == 0) {
		writeln(0);
		return;
	}
	
	ulong res = ulong.max;
	if(H >= 3) res = min(res, H);
	if(W >= 3) res = min(res, W);
	foreach(h; 1..H) {
		ulong S1 = h*W, S2 = (H-h)*(W/2), S3 = (H-h)*((W+1)/2);
		res = min(res, max(S1,S2,S3) - min(S1,S2,S3));
		//writefln("%d %d %d", S1, S2, S3);
	}
	
	foreach(w; 1..W) {
		ulong S1 = w*H, S2 = (W-w)*(H/2), S3 = (W-w)*((H+1)/2);
		res = min(res, max(S1,S2,S3) - min(S1,S2,S3));
		//writefln("%d %d %d", S1, S2, S3);
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
