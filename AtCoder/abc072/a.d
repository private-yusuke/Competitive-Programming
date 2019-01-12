import std.stdio;
import std.string;
import std.conv;
import std.algorithm;

void main() {
	string[] inputs = split(readln());
	int X = to!int(inputs[0]);
	int t = to!int(inputs[1]);
	
	max(0, X-t).writeln;
}
