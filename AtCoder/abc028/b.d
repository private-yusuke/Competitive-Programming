import std.stdio;
import std.string;
import std.conv;
import std.algorithm;
import std.math;
import std.regex;

void main() {
	auto S = readln.chomp;
	auto counts = new uint[](6);
	foreach(i; 0..6) {
		counts[i] = to!uint(count(S, 'A'+i));
	}
	writefln("%d %d %d %d %d %d", counts[0], counts[1], counts[2], counts[3], counts[4], counts[5], );
}
