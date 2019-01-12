import std.stdio;
import std.string;
import std.conv;
import std.algorithm;

void main() {
	int a = to!int(chomp(readln()));
	int b = to!int(chomp(readln()));
	int h = to!int(chomp(readln()));
	
	int surface = (a + b) * h / 2;
	surface.writeln;
}
