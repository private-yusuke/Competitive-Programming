void main() {
	auto ip = readAs!(int[]), N = ip[0], M = ip[1];
	alias Node = Tuple!(int, "v", bool, "back");
	Node[] arr;
	auto done = redBlackTree!int();
	Node[][] nodes = new Node[][](N+1, 0);
	foreach(i; 0..M) {
		auto ip2 = readAs!(int[]), a = ip2[0], b = ip2[1];
		nodes[a] ~= Node(i, false);
		nodes[b] ~= Node(i, true);
	}
	debug nodes.writeln;
	ulong tmp, tmp2;
	foreach(ind, i; nodes) {

		foreach(j; i) {
			debug arr.writeln("!");
			debug done.writeln("?");
			debug arr.canFind(j.v).writeln;
			Node k = j;
			k.back = !k.back;
			if((arr.canFind(j) || arr.canFind(k)) && done.equalRange(j.v).empty) {
				tmp++;
				debug j.writeln;
				/*if(arr.reduce!max <= ind) {
					done ~= arr;
					arr = [];
				}
				else {
					done ~= arr[0..arr.countUntil(j)+1];
					arr = arr[arr.countUntil(j)..$];
				}*/
				done.insert(arr.filter!(a => !a.back).map!(a => a.v));
				arr = arr.filter!(a => a.back).array;
			} else arr ~= j;
		}
	}
	writeln(tmp);
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