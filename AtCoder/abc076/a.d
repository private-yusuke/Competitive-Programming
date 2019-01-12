import std.stdio;
import std.string;
import std.conv;

void main() {
	int R = to!int(chomp(readln()));
	int G = to!int(chomp(readln()));
	
	// (R + P)/2 = G
	// R + P = 2G
	// P = 2G - R
	
	writeln(2*G - R);
}
