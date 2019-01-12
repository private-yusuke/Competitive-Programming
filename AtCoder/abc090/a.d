import std.stdio;
import std.string;
import std.conv;
import std.algorithm;
import std.math;
import std.regex;
import std.range;

void main() {
	char[] a;
	foreach(i; 0..3) {
		a ~= readln.chomp[i];
	}
	a.writeln;
}
