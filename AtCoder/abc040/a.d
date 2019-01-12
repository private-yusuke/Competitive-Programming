import std.stdio;
import std.string;
import std.conv;
import std.algorithm;

void main() {
	string[] inputs = split(readln());
	int n = to!int(inputs[0]);
	int x = to!int(inputs[1]);
	if(n/2. >= x) (x-1).writeln;
	else (n-x).writeln;
}
