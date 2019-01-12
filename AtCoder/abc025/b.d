import std.stdio;
import std.string;
import std.conv;
import std.algorithm;
import std.math;
import std.regex;

void main() {
	auto ip1 = readln.split.to!(int[]), N = ip1[0], A = ip1[1], B = ip1[2];
	int x;
	foreach(_; 0..N) {
		auto ip2 = readln.split, s = ip2[0], d = ip2[1].to!int;
		if(d < A) x += (s == "West" ? A : -A);
		else if(d > B) x += (s == "West" ? B : -B);
		else x += (s == "West" ? d : -d);
	}
	if(x > 0) writefln("West %d", x);
	else if(x < 0) writefln("East %d", -x);
	else writeln(0);
}
