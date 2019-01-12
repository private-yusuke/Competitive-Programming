import std.stdio;
import std.string;
import std.conv;
import std.algorithm;

void main() {
	string input = chomp(readln());
	if(input[$-1] == 'T') "YES".writeln;
	else "NO".writeln;
}
