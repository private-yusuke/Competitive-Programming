import std.stdio;
import std.string;
import std.conv;
import std.algorithm: canFind;

void main() {
	string[] inputs = split(readln());
	int a = to!int(inputs[0]);
	int b = to!int(inputs[1]);
	int c = to!int(inputs[2]);
	
	if(b - a == c - b) "YES".writeln;
	else "NO".writeln;
}
