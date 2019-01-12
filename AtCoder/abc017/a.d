import std.stdio;
import std.string;
import std.conv;
import std.algorithm;
import std.math;

void main() {
	double res = 0.;
	foreach(i; 0..3) {
		auto a = readln.split.to!(int[]), s = a[0], e = a[1];
		res += s * (e/10.);
	}
	writeln(res.to!int);
}
