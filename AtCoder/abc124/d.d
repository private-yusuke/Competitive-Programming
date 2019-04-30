void main() {
	auto ip = readAs!(int[]), N = ip[0], K = ip[1];
	auto S = rs;
	auto arr = new int[](N);
	auto arr0 = new int[](N);
	
	if(N == 1) {
		writeln(1);
		return;
	}
	char last = S[0];
	if(last == '0') {
		arr[0] = 1;
		arr0[0] = 1;
	}
	
	foreach(i, v; S[1..$]) {
		ulong k = i + 1;
		if(v == last) {
			arr[k] = arr[i];
			continue;
		}
		if(v == '0') arr[k] = arr[i] + 1;
		else arr[k] = arr[i];
		last = v;
	}
	foreach(i, v; S[1..$]) {
		ulong k = i + 1;
		
		if(v == '0') {
			arr0[k] = arr0[i] + 1;
		} else arr0[k] = arr0[i];
	}
	debug arr.writeln;
	debug arr0.writeln;
	if(arr.front == '0') arr = 1 ~ arr;
	if(arr.front == '0') arr0 = 1 ~ arr0;
	if(arr.front == '0') N++;
	
	ulong res, tmp;
	ulong r = 1;
	foreach(l; 0..N) {
		while(r < N) {
			debug writeln("test");
			debug writef("[%d, %d]", l, r);
			debug writeln("test");
			if(arr[r] - arr[l] <= K) {
				debug writeln(" ok");
				tmp++;
				debug writefln("%d, %d, %s", arr[r] - arr[l], tmp, S[l..r]);
				res = max(res, tmp);
				r++;
			} else {
				debug writeln(" ng");
				break;
			}
		}
		tmp--;
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
