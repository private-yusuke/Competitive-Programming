import std.stdio;
import std.string;
import std.conv;
import std.algorithm;
import std.math;

void main() {
	string S = chomp(readln());
	int N = to!int(chomp(readln()));
	string[] m;
	foreach(c; S) {
		for(int i = 0; i < 5; i++) {
			m ~= format("%s%s", c, S[i]);
		}
	}
	m[N-1].writeln;
}
