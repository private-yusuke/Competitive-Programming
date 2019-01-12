import std.stdio;
import std.string;
import std.conv;
import std.algorithm;
import std.math;

void main() {
	auto N = readln.chomp.to!int;
	bool[int] d;
	foreach(_; 0..N) {
		d[readln.chomp.to!int] = true;
	}
	writeln(d.length);
}
