import std.stdio;
import std.string;
import std.conv;
import std.range;
import std.algorithm;
import std.math;
import std.regex;

void main() {
	auto s = readln.chomp, k = readln.chomp.to!int;
	string[] a;
	if(s.length < k) {
		writeln(0);
		return;
	}
	foreach(i; 0..s.length-k+1) {
		a ~= s[i..i+k];
	}
	a.sort().uniq.array.length.writeln;
}
