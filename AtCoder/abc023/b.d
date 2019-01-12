import std.stdio;
import std.string;
import std.conv;
import std.algorithm;
import std.math;
import std.regex;

void main() {
	readln;
	auto S = readln.chomp;
	if(S.length % 2 != 1) {
		writeln("-1");
		return;
	}
	if(S == "b") {
		writeln(0);
		return;
	}
	uint n = to!uint((S.length - 1) / 2);
	
	switch(n % 3) {
		case 0:
			auto regex = ctRegex!"^bc(abc)*ab$";
			if(!matchFirst(S, regex)) {
				writeln("-1");
			} else writeln(n);
			break;
		case 1:
			auto regex = ctRegex!"^(abc)*$";
			if(!matchFirst(S, regex)) {
				writeln("-1");
			} else writeln(n);
			break;
		case 2:
			auto regex = ctRegex!"^c(abc)*a$";
			if(!matchFirst(S, regex)) {
				writeln("-1");
			} else writeln(n);
			break;
		default:
			break;
	}
}
