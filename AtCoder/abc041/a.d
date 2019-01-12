import std.stdio;
import std.string;
import std.conv;
import std.algorithm;

void main() {
	string s = chomp(readln());
	int i = to!int(chomp(readln()));
	s[i-1].writeln;
}
