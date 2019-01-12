import std.stdio;
import std.string;
import std.conv;
import std.algorithm;
import std.math;
import std.regex;

void main() {
	auto ip = readln.split.to!(int[]), N = ip[0], A = ip[1], B = ip[2];
	int r;
	foreach(i; 1..N+1) {
		auto digits = i.to!(dchar[]);
		int count;
		foreach(a; digits) {
			count += a.to!int - '0';
		}
		if(count >= A && count <= B) {
			r += i;
		}
	}
	writeln(r);
}
