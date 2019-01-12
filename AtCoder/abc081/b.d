import std.stdio;
import std.string;
import std.conv;
import std.algorithm;
import std.math;
import std.regex;

void main() {
	auto N = readln.chomp.to!int;
	auto A = readln.split.to!(uint[]);
	uint count;
	loop: while(true) {
		foreach(ref A_i; A) {
			if(A_i % 2 != 0) break loop;
			else A_i /= 2;
		}
		count++;
	}
	writeln(count);
}
