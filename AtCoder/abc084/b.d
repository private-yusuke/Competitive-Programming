import std.stdio;
import std.string;
import std.conv;
import std.algorithm;
import std.math;
import std.regex;

void main() {
	auto ip = readln.split.to!(int[]), A = ip[0], B = ip[1];
	auto S = readln.chomp;
	if(S[A] != '-') {
		writeln("No");
		return;
	}
	auto regex_a = regex(format("^[0-9]{%d}", A));
	if(matchFirst(S, regex_a).empty) {
		writeln("No");
		return;
	}
	auto regex_b = regex(format("[0-9]{%d}$", B));
	if(matchFirst(S, regex_b).empty) {
		writeln("No");
		return;
	}
	writeln("Yes");
}
