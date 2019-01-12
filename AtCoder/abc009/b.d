import std.stdio;
import std.string;
import std.conv;
import std.algorithm;
import std.math;

void main() {
	auto N = readln.chomp.to!int;
	auto a = new int[](N);
	foreach(i; 0..N) a[i] = readln.chomp.to!int;
	a.sort!("a > b");
	foreach(i; 1..N) {
		int f = a[0];
		if(f > a[i]) {
			a[i].writeln;
			break;
		}
	}
}
