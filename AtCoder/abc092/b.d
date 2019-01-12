import std.stdio;
import std.string;
import std.conv;
import std.algorithm;
import std.math;
import std.conv;

void main() {
	auto N = r;
	auto ip = readln.split.to!(int[]), D = ip[0], X = ip[1];
	int count;
	foreach(_; 0..N) {
		count += ceil(D / r.to!real).to!int;
		//count++;
	}
	(count + X).writeln;
}

int r() {
	return readln.chomp.to!int;
}