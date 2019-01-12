import std.stdio;
import std.string;
import std.conv;
import std.algorithm;
import std.math;
import std.regex;

const dx = [-1, 0, 1, -1, 1, -1, 0, 1];
const dy = [-1, -1, -1, 0, 0, 1, 1, 1];

void main() {
	auto ip = readln.split.to!(int[]), H = ip[0], W = ip[1];
	char[][] S;
	foreach(_; 0..H) S ~= readln.chomp.dup;
	
	foreach(i; 0..H) {
		foreach(j; 0..W) {
			if(S[i][j] != '#') {
				int count;
				foreach(m; -1..2) {
					if(i+m < 0 || i+m >= H) continue;
					foreach(n; -1..2) {
						if(j+n < 0 || j+n >= W) continue;
						if(S[i+m][j+n] == '#') count++;
					}
				}
				S[i][j] = ('0' + count).to!char;
			}
		}
	}
	foreach(i; 0..H) {
		writeln(S[i]);
	}
}
