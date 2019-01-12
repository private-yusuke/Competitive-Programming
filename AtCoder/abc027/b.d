import std.stdio;
import std.string;
import std.conv;
import std.algorithm;
import std.math;
import std.regex;

void main() {
	auto N = readln.chomp.to!int;
	auto a = readln.split.to!(int[]);
	
	auto b = a.sum / N;
	if(a.sum % N != 0) {
		writeln(-1);
		return;
	}
	int count;
	int s;
	foreach(a_i; a) {
		s += a_i - b;
		if(s != 0) {
			count++;
		}
	}
	writeln(count);
}
