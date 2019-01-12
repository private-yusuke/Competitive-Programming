import std.stdio;
import std.string;
import std.conv;
import std.algorithm;
import std.math;

void main() {
	auto S = readln.chomp;
	string res;
	res ~= toUpper(S[0]);
	foreach(i; 1..S.length) {
		res ~= toLower(S[i]);
	}
	res.writeln;
}
