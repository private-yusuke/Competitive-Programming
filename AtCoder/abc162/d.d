void main() {
	auto N = ri;
	auto S = rs;
	auto arr = new ulong[][](3, N);
	ulong conv(dchar c) {
		switch(c) {
			case 'R': return 0;
			case 'G': return 1;
			case 'B': return 2;
			default: assert(0);
		}
	}
	arr[conv(S[0])][0] = 1;
	foreach(i; 0..N-1) {
		foreach(k; 0..3) {
			arr[k][i+1] = arr[k][i];
		}
		auto ind = conv(S[i+1]);
		arr[ind][i+1] = arr[ind][i] + 1;
	}
	ulong res;
	debug arr.each!writeln;
	foreach(i; 0..N-2) foreach(j; i..N-1) {
		if(S[i] == S[j]) continue;
		auto tmp = [S[i], S[j]].to!(dchar[]).sort.array;
		dchar no;
		switch(tmp) {
			case ['B', 'G']:
				no = 'R';
				break;
			case ['B', 'R']:
				no = 'G';
				break;
			default: no = 'B'; break;
		}
		
		debug writefln("%d - %d", arr[conv(no)][$ - 1], arr[conv(no)][j]);
		auto tmp2 = arr[conv(no)][$ - 1] - arr[conv(no)][j];
		if((j-i) + j < N && S[ (j-i) + j] == no) tmp2--;

		debug writefln("%d %d %d", i, j, tmp2);
		res += tmp2;
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