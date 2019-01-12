import std.stdio;
import std.string;
import std.conv;

void main() {
	int M = to!int(chomp(readln()));
	writeln(format("%s\n", 48-M));
}
