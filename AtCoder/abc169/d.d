void main() {
	auto N = readAs!long;

	auto m = redBlackTree!long;
	auto plist = generate_prime_list(1000001);
	if(isPrime(N)) {
		writeln(1);
		return;
	}

	// 5327304283665
	// 
	ulong cnt;

	ulong M = N;
	foreach(p; plist) {
		while(M % p == 0) {
			M /= p;
		}
	}
	if(M > 1000000) {
		m.insert(M);
		cnt++;
		N = N / M;
	}

	while(N > 1) {
		debug writefln("N: %d", N);

		bool done = false;
		loop: foreach(p; plist) {
			//debug writefln("p: %d", p);
			if(p > N) break;
			ulong z = p;
			while(z <= N) {
				if(N % z == 0 && (N / z).isPrime) {
					if((N / z) !in m) {
						m.insert(N / z);
						N = z;
						cnt++;
						done = true;
						break loop;
					}
				}
				if(z !in m && N % z == 0) {
					debug writefln("z: %d", z);
					m.insert(z);
					N /= z;
					cnt++;
					done = true;
					break loop;
				}
				z *= p;
			}
			
		}
		if(!done) break;
	}
	debug m.writeln;
	cnt.writeln;
}
bool isPrime(ulong n) {
	if(n <= 1) return false;
	else if(n == 2) return true;
	else if(n % 2 == 0) return false;

	foreach(i; iota(3, n.to!double.sqrt.ceil+1, 2)) {
		if(n % i == 0) return false;
	}
	return true;
}

ulong[] generate_prime_list(T)(T N) if(isIntegral!T) {
	ulong[] prime_list = [2];
	bool not_prime = false;
	foreach(i; 3..N.to!ulong+1) {
		auto p = i.to!float.sqrt.ceil.to!ulong;
		foreach(j; prime_list) {
			if(j > p) break;
			if(i % j == 0) {
				not_prime = true;
				break;
			}
		}
		if(!not_prime) prime_list ~= i;
		not_prime = false;
	}
	return prime_list;
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

long rl() {
	return readAs!long;
}

double rd() {
	return readAs!double;
}

string rs() {
	return readln.chomp;
}