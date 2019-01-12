import std.stdio;
import std.string;
import std.conv;

void main() {
	int x = to!int(chomp(readln()));
	writeln(x < 1200 ? "ABC": "ARC");
}
