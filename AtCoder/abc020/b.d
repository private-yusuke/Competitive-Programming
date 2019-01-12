import std.stdio;
import std.string;
import std.conv;
import std.algorithm;
import std.math;
import std.bitmanip;

void main() {
	auto ip = readln.split, S = (ip[0] ~ ip[1]).to!int;
	writeln(S*2);
}
