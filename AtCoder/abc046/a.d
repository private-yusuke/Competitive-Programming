import std.stdio;
import std.string;
import std.conv;
import std.algorithm;

void main() {
	string[] inputs = split(readln());
	int a = to!int(inputs[0]);
	int b = to!int(inputs[1]);
	int c = to!int(inputs[2]);
	bool[int] flags;
	flags[a] = true;
	flags[b] = true;
	flags[c] = true;
	flags.length.writeln;
}
