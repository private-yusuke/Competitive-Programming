import std.stdio;
import std.string;
import std.conv;

void main() {
	int N = to!int(chomp(readln()));
	int x = N * 800;
	int y = (N / 15) * 200;
	(x - y).writeln;
}
