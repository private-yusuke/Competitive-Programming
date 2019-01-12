import std.stdio;
import std.string;
import std.conv;
import std.algorithm;
import std.math;

void main() {
	string input = chomp(readln());
	bool[char] flags;
	foreach(c; input) {
		flags[c] = true;
	}
	if(flags.length == 1) "SAME".writeln;
	else "DIFFERENT".writeln;
}
