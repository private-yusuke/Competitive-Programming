import std.stdio;
import std.string;
import std.conv;
import std.algorithm;
import std.math;

void main() {
	auto c = new string[][](4, 4);
	foreach(i; 0..4) {
		auto inputs = readln.split;
		foreach(j; 0..4) {
			c[i][j] = inputs[j];
		}
	}
	for(int i = 3; i >= 0; i--) {
		auto d = c[i];
		writefln("%s %s %s %s", d[3], d[2], d[1], d[0]);
	}
}
