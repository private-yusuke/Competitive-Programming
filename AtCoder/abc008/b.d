import std.stdio;
import std.string;
import std.conv;
import std.algorithm;
import std.math;

void main() {
	int N = readln.chomp.to!int;
	int[string] S;
	foreach(i; 0..N) {
		S[readln.chomp]++;
	}
	int r;
	string c;
	foreach(key, value; S) {
		if(value > r) {
			r = value;
			c = key;
		}
	}
	c.writeln;
}
