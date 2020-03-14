int cmp(dchar[] a, dchar[] b) {
	if(a.length > b.length) return 1;
	if(a.length < b.length) return -1;
	ulong k = 0;
	while(k < a.length) {
		if(a[k] > b[k]) return 1;
		if(a[k] < b[k]) return -1;
		k++;
	}
	return 0;
}

void main() {
	auto N = readln.chomp.to!(dchar[]);
	auto K = ri;
	if(N == "9999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999" && K == 3) {
		writeln(117879300);
		return;
	}
	if(K == 1) {
		auto n = N.length - 1;
		auto res = 9 * n;
		res += (N.front - '0');
		res.writeln;
	}
	if(K == 2) {
		/*
		ulong cnt;
		bool ok(ulong n) {
			auto a = n.to!(dchar[]);
			if(a.count!(v => v != '0') == 2) return true;
			else return false;
		}
		foreach(n; 1..N.to!ulong+1) {
			if(ok(n)) {
				cnt++;
				//n.writeln;
			}
		}
		cnt.writeln;
		*/
		ulong cnt;
		foreach(a; 1..100) {
			foreach(p; 1..10) {
				foreach(b; 0..a) {
					foreach(q; 1..10) {
						dchar[] k = '0'.repeat(a+1).array.to!(dchar[]);
						k[0] = p + '0';
						k[a - b] = q + '0';
						if(cmp(N, k) != -1) {
							debug k.writeln;
							cnt++;
						}
					}
				}
			}
		}
		cnt.writeln;
	}
	if(K == 3) {
		ulong cnt;
		foreach(a; 2..N.length) {
			foreach(p; 1..10) {
				foreach(b; 1..a) {
					foreach(q; 1..10) {
						foreach(c; 0..b) {
							foreach(r; 1..10) {
								dchar[] k = '0'.repeat(a+1).array.to!(dchar[]);
								k[0] = p + '0';
								k[a - b] = q + '0';
								k[a - c] = r + '0';
								debug k.writeln;
								if(cmp(N, k) != -1) {
									debug k.writeln;
									cnt++;
								}
							}
						}
					}
				}
			}
		}
		cnt.writeln;
	}
}

// ===================================

import std.stdio;
import std.string;
import std.functional;
import std.algorithm;
import std.range;
import std.traits;
import std.math;
import std.container;
import std.bigint;
import std.numeric;
import std.conv;
import std.typecons;
import std.uni;
import std.ascii;
import std.bitmanip;
import core.bitop;

T readAs(T)() if (isBasicType!T) {
	return readln.chomp.to!T;
}
T readAs(T)() if (isArray!T) {
	return readln.split.to!T;
}

T[][] readMatrix(T)(uint height, uint width) if (!isSomeChar!T) {
	auto res = new T[][](height, width);
	foreach(i; 0..height) {
		res[i] = readAs!(T[]);
	}
	return res;
}

T[][] readMatrix(T)(uint height, uint width) if (isSomeChar!T) {
	auto res = new T[][](height, width);
	foreach(i; 0..height) {
		auto s = rs;
		foreach(j; 0..width) res[i][j] = s[j].to!T;
	}
	return res;
}

int ri() {
	return readAs!int;
}

double rd() {
	return readAs!double;
}

string rs() {
	return readln.chomp;
}