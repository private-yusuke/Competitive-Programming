import std.stdio;
import std.string;
import std.conv;
import std.algorithm;
import std.math;
import std.regex;

void main() {
	auto ip = readln.split.to!(int[]), N = ip[0], L = ip[1];
	auto S = new string[](N);
	foreach(i; 0..N) 
		S[i] = readln.chomp;
	S.sort();
	string res;
	foreach(S_i; S) {
		res ~= S_i;
	}
	writeln(res);
}
