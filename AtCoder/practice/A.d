import std.stdio, std.conv, std.string;

void main() {
	int a = to!int(chomp(readln()));
	string[] input = split(readln());
	int b = to!int(input[0]);
	int c = to!int(input[1]);
	
	string s = chomp(readln());
	
	writefln("%d %s", a+b+c, s);
}
