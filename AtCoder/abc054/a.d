import std.stdio;
import std.string;
import std.conv;

void main() {
	string[] inputs = split(readln());
	int A = to!int(inputs[0]);
	int B = to!int(inputs[1]);
	if(A == B) "Draw".writeln;
	else if(A == 1 && B > 1) "Alice".writeln;
	else if(B == 1 && A > 1) "Bob".writeln;
	else if(A > B) "Alice".writeln;
	else "Bob".writeln;
}
