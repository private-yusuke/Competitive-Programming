import std.stdio;
import std.string;
import std.conv;
import std.algorithm;
import std.math;
import std.conv;

void main() {
	auto N = readln.chomp.to!int;
	int alice, bob;
	auto a = readln.split.to!(int[]);
	a.sort!"a > b";

	foreach(i; 0..N) {
		if(i & 1) bob += a[i];
		else alice += a[i];
	}
	(alice - bob).writeln;
}