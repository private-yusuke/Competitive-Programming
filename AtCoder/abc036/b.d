import std.stdio;
import std.string;
import std.conv;
import std.algorithm;
import std.math;
import std.range;

void main() {
	auto N = readln.chomp.to!int;
	auto a = new string[](N);
	foreach(i;0..N)a[i] = readln.chomp;
	foreach(i;0..N) {
		foreach(j;0..N) {
			write(a[N-1-j][i]);
		}
		writeln;
	}
}
