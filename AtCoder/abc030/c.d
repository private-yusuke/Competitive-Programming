void main() {
	const string query = q{
		loadArgs 2 N M
		wr ip
		wr N
		wr M
		
	};
	mixin(play(query));
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

static string wr(string str) {
	return format("writeln(%s);", str);
}
static string play(string str) {
	auto arr = str.split('\n');
	string[] things;
	foreach(i; arr) {
		things ~= i.replace("\t", "").chomp;
	}
	string res;
	foreach(i; things) {
		auto commands = i.split;
		if(!commands) continue;
		switch(commands[0]) {
			case "loadArgs":
				res ~= loadArgs(commands[1..$]);
				break;
			case "wr":
				res ~= wr(commands[1..$]);
				break;
			default:
				break;
		}
	}
	return res;
}
static string loadArgs(string[] arr) {
	string res;
	int N = arr[0].to!int;
	string ip;
	if(arr.length == N + 2) ip = arr[$-1];
	else ip = "ip";
	res ~= format("auto %s = readAs!(int[]), ", ip);
	foreach(i; 0..N) {
		string name;
		if(i + 2 > arr.length) name = ('a' + i).to!char.to!string;
		else name = arr[i+1];

		res ~= format("%s = %s[%d]", name, ip, i);
		if(i == N - 1) res ~= ';';
		else res ~= ", ";
	}
	return res;
}
static string wr(string[] arr) {
	return format("writeln(%s);", arr[0]);
}