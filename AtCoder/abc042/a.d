import std.stdio;
import std.string;
import std.conv;
import std.algorithm;

void main() {
	string[] inputs = split(readln());
	int a, b;
	foreach(v; inputs) {
		switch(v) {
			case "5":
				a++;
				break;
			case "7":
				b++;
				break;
			default:
				break;
		}
	}
	if(a == 2 && b == 1) "YES".writeln;
	else "NO".writeln;
}
