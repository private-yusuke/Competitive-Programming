import std.stdio;
import std.string;
import std.conv;
import std.algorithm;
import std.math;
import std.regex;

struct Point {
	int x;
	int y;
}

Point p = Point(0, 0);

void main() {
	auto S = readln.chomp, T = readln.chomp.to!int;
	int count;
	foreach(S_i; S) {
		switch(S_i) {
			case 'L':	p.x--; break;
			case 'R':	p.x++; break;
			case 'U':	p.y++; break;
			case 'D':	p.y--; break;
			case '?':	count++; break;
			default: break;
		}
	}
	
	if(T == 1) solve1(S, count);
	else solve2(S, count);
}

void solve1(string S, uint count) {
	(abs(p.x) + abs(p. y) + count).writeln;
}

void solve2(string S, uint count) {
	/*if(abs(p.x) - count < 0) {
		p.x = 0;
		count -= abs(p.x);
		if(abs(p.y) - count < 0) {
			p.y = 0;
			count -= abs(p.y);
			if(count & 1) {
				writeln(1);
			} else writeln(0);
		}
		else {
			(abs(p.y) - count).writeln;
		}
	} else {
		(abs(p.x) + abs(p.y) - count).writeln;
	}*/
	int M = abs(p.x) + abs(p.y);
	if(M >= count) writeln(M - count);
	else {
		if((count - M) & 1) writeln(1);
		else writeln(0);
	}
}
