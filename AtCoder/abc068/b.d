import std.stdio;
import std.string;
import std.conv;
import std.algorithm;
import std.math;
import std.regex;

void main() {
	auto N = readln.chomp.to!int;
	foreach(i;1..10) {
		if(pow(2, i) >= N) {
			pow(2, i-1).writeln;
			break;
		}
	}
}