import std.stdio;
import std.string;
import std.conv;
import std.algorithm;
import std.math;

void main() {
	auto inputs = readln.split.to!(int[]), N = inputs[0], S = inputs[1], T = inputs[2];
	auto W = readln.chomp.to!int;
	auto a = new int[](N);
	foreach(i; 1..N) a[i] = readln.chomp.to!int;
	
	auto c = 0;
	foreach (a_i; a) {
		W += a_i;
		if(W >= S && W <= T) c++;
	}
	c.writeln;
}
