import std.stdio;
import std.string;
import std.conv;
import std.algorithm;

void main() {
	string input = chomp(readln());
	switch(input) {
		case "a", "i", "u", "e", "o":
			"vowel".writeln;
			break;
		default:
			"consonant".writeln;
			break;
	}
}
