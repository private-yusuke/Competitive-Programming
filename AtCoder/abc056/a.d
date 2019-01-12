import std.stdio;
import std.string;
import std.conv;

void main() {
	string[] inputs = split(readln());
	bool a = inputs[0] == "H";
	bool b = inputs[1] == "H";
	if(a == b) 'H'.writeln;
	else 'D'.writeln;
}
