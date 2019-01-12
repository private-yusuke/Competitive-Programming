import std.stdio;
import std.string;
import std.conv;
import std.range;
import std.algorithm;
import std.math;
import std.bitmanip;

void main() {
	auto S = readln.chomp;
	if(S.length == 0) {
		writeln("YES");
		return;
	}
	
	foreach(ref i; 0..S.length) {
		switch(S[i]) {
			case 'o', 'k', 'u':
				break;
			case 'c':
				if(S[i+1] == 'h') i++;
				else { writeln("NO"); return; }
				break;
			default:
				writeln("NO");
				return;
		}
	}
	writeln("YES");
}
