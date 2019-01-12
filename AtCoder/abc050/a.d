import std.stdio;
import std.string;
import std.conv;
import std.algorithm;

void main() {
	string[] inputs = split(readln());
	int A = to!int(inputs[0]);
	char op = inputs[1][0];
	int B = to!int(inputs[2]);
	
	if(op == '+') (A + B).writeln;
	else (A - B).writeln;
}
