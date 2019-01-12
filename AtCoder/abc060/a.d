import std.stdio;
import std.string;
import std.conv;
import std.algorithm: canFind;

void main() {
	string[] inputs = split(readln());
	string A = inputs[0];
	string B = inputs[1];
	string C = inputs[2];
	if(A[$-1] == B[0] && B[$-1] == C[0]) "YES".writeln;
	else "NO".writeln;
}
