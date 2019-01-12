import std.stdio;
import std.string;
import std.conv;

void main() {
	string input = readln();
	char a = input[0];
	char b = input[1];
	if(a == '9' || b == '9') {
		"Yes".writeln;
	} else {
		"No".writeln;
	}
}
