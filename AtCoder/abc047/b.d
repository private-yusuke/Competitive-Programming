import std.stdio;
import std.string;
import std.conv;
import std.algorithm;
import std.range;
import std.traits;
import std.math;
import std.conv;
import std.typecons;

void main() {
	alias Point = Tuple!(int, "x", int, "y");
	auto ip = readAs!(int[]), W = ip[0], H = ip[1], N = ip[2];
	// 下はダメコード
	/*auto b = new bool[][](H, W);
	b[][] = true;
	b.writeln;
	foreach(_; 0..N) {
		auto ip2 = readAs!(int[]), x = ip2[0], y = ip2[1], a = ip2[2];
		switch(a) {
			case 1:
				b[][0..x] = false;
				break;
			case 2:
				b[][x+1..$] = false;
				break;
			case 3:
				b[0..y][] = false;
				break;
			case 4:
				b[y+1..$][] = false;
				break;
			default: break;
		}
	}
	b.reduce!(a => a.count!true).sum.writeln;*/
	auto p_s = Point(0, 0), p_g = Point(W, H);
	foreach(_; 0..N) {
		auto ip2 = readAs!(int[]), x = ip2[0], y = ip2[1], a = ip2[2];
		switch(a) {
			case 1:
				p_s.x = max(p_s.x, x);
				break;
			case 2:
				p_g.x = min(p_g.x, x);
				break;
			case 3:
				p_s.y = max(p_s.y, y);
				break;
			case 4:
				p_g.y = min(p_g.y, y);
				break;
			default: break;
		}
	}
	//"(%d, %d), (%d, %d)".writefln(p_s.x, p_s.y, p_g.x, p_g.y);
	//max((p_g.x - p_s.x) * (p_g.y - p_s.y), 0).writeln;
	auto width = max(p_g.x - p_s.x, 0);
	auto height = max(p_g.y - p_s.y, 0);
	(width * height).writeln;
}

// ===================================

T readAs(T)() if (isBasicType!T) {
	return readln.chomp.to!T;
}
T readAs(T)() if (isArray!T) {
	return readln.split.to!T;
}

T[][] readMatrix(T)(uint height, uint width) if (isBasicType!T) {
	auto res = new T[][](height, width);
	foreach(i; 0..height) {
		res[i] = readAs!(T[]);
	}
	return res;
}

int ri() {
	return readAs!int;
}

string rs() {
	return readln.chomp;
}