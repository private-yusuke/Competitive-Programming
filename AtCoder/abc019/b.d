import std.stdio;
import std.string;
import std.conv;
import std.algorithm;
import std.math;
import std.bitmanip;

void main() {
	auto s = readln.chomp;
	char lastChar = s[0];
	int lastCount;
	string res;
	
	foreach(c; s) {
		if(c == lastChar) lastCount++;
		else {
			res ~= format("%s%d", lastChar, lastCount);
			lastChar = c;
			lastCount = 1;
		}
	}
	res ~= format("%s%d", lastChar, lastCount);
	res.writeln;
}
