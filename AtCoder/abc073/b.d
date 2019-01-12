import std.stdio;
import std.string;
import std.conv;
import std.algorithm;
import std.math;
import std.regex;

void main() {
	auto N = readln.chomp.to!int;
	int count;
	foreach(_; 0..N) {
		auto ip = readln.split.to!(int[]);
		count += ip[1] - ip[0] + 1;
	}
	writeln(count);
}