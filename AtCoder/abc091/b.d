import std.stdio;
import std.string;
import std.conv;
import std.algorithm;
import std.math;

void main() {
	int[string] a;
	ubyte N = readln.chomp.to!ubyte;
	foreach(_; 0..N) {
		a[readln.chomp]++;
	}
	ubyte M = readln.chomp.to!ubyte;
	foreach(_; 0..M) {
		a[readln.chomp]--;
	}
	max(a.values.reduce!max, 0).writeln;
}