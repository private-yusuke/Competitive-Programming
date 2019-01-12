import std.stdio;
import std.string;
import std.conv;
import std.algorithm;
import std.math;
import std.regex;

void main() {
	auto ip = readln.split.to!(int[]), n = ip[0], m = ip[1];
	real H = ((n%12)*60+m)*0.5;
	real M = m*6;
	real res;
	if(H < M) {
		res = M - H;
	} else {
		res = H - M;
	}
	if(res > 180) res = 360 - res;
	writeln(res);
}
