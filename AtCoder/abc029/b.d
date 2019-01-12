import std.stdio;
import std.string;
import std.conv;
import std.algorithm;
import std.math;
import std.regex;

void main() {
	int count;
	foreach(_; 0..12) {
		auto S = readln.chomp;
		if(S.contains('r')) {
			count++;
		}
	}
	writeln(count);
}

bool contains(string s, char c) {
	if(indexOf(s, c) == -1) return false;
	else return true;
}
