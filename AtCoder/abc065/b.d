import std.stdio;
import std.string;
import std.conv;
import std.algorithm;
import std.math;
import std.regex;
import std.range;
import core.exception;

void main() {
	auto N = readln.chomp.to!int;
	auto a = new int[](N);
	foreach(i; 0..N) {
		a[i] = readln.chomp.to!int;
	}
	bool[int] b;
	foreach(i; 0..N+1) b[i] = false;
	
	int current = 1, count;
	while(true) {
		if(b[current]) {
			(-1).writeln;
			return;
		}
		if(current == 2) {
			count.writeln;
			return;
		}
		b[current] = true;
		current = a[current-1];
		count++;
	}
}
