import std.stdio;
import std.string;
import std.conv;
import std.algorithm;
import std.math;
import std.regex;

void main() {
	readln;
	auto A = readln.split;
	int[2] lines;
	foreach(A_i; A.uniq) {
		if(A.count(A_i) >= 2) {
			auto a = A_i.to!int;
			if(a == lines[0]) continue;
			else if(a > lines[0]) {
				lines[1] = lines[0];
				lines[0] = a;
	 		} else if(a > lines[1]) {
	 			lines[1] = a;
	 		}
		}
	}
	if(lines[0] == 0 || lines[1] == 0) writeln(0);
	else writeln(lines[0] * lines[1]);
}