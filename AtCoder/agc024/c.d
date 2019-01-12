void main() {
	auto N = ri;
	auto A = iota(N).map!(a => ri).array;
	if(A[0] > 0) { // むりむりのむり(X[0]は0以外の非負整数になれない)
		writeln(-1);
		return;
	}
	foreach_reverse(i; 1..N) {
		if(A[i]-A[i-1] > 1) { // むりむりのむり(数列を作る過程で(後ろ)-(前)が2以上にすることはできない)
			writeln(-1);
			return;
		}
	}
	ulong ans;
	foreach_reverse(i; 1..N) {
		debug writefln("i: %d", i);

		/*
		1, 2, 3, ..., n のような列はn回の操作で作れる
		ex)	1 2 3 4
			0 0 0 0
		1	1 0 0 0
		2	1 2 0 0
		3	1 2 3 0
		4	1 2 3 4
		こういう、iota(1, n+1)のような列を「いいやつ」とする。

		もし A[i] が A[i-1]+1 より小さいなら、A[i]で完成する「いいやつ」を作った後に、
		A[i-1]で完成する別の「いいやつ」を作らないといけない。
		ex) 1 2 3 3
			0 0 0 0
		1	0 1 0 0
		2	0 1 2 0
		3	0 1 2 3	… 1つ目の「いいやつ」が完成

		4	1 1 2 3 … 2つ目の「いいやつ」を作り始める
		5	1 2 2 3
		6	1 2 3 3 … 2つ目の「いいやつ」が完成

		こうして見ると、A[i]とA[i-1]が一つの「いいやつ」の中で存在するなら、その差は1であるから、
		A[i]を作るための操作回数は1回でいい。
		もしA[i]とA[i-1]が一つの「いいやつ」の中で存在しない、すなわちその差が2以上なら、
		まずA[i]のための「いいやつ」を作る回数、すなわちA[i]回の操作が必要。
		*/
		if(A[i] - A[i-1] == 1) ans++;
		else ans += A[i];
	}
	ans.writeln;
}

// ===================================

import std.stdio;
import std.string;
import std.conv;
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

T[] deepcopy(T)(T[] a) {
	static if(isArray!T) {
		T[] res;
		foreach(i; a) {
			res ~= deepcopy(i);
		}
		return res;
	} else {
		return a.dup;
	}
}

ulong[] generate_prime_list(T)(T N) if(isIntegral!T) {
	ulong[] prime_list = [2];
	bool not_prime = false;
	foreach(i; 3..N.to!ulong+1) {
		foreach(j; prime_list) {
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

bool isPrime(ulong n) {
	if(n <= 1) return false;
	else if(n == 2) return true;
	else if(n % 2 == 0) return false;

	foreach(i; iota(3, n.to!double.sqrt.ceil+1, 2)) {
		if(n % i == 0) return false;
	}
	return true;
}

class UnionFind(T) {
	T[] arr;
	this(ulong n) {
		arr.length = n+1;
		arr[] = -1;
	}
	T root(T x) {
		return arr[x] < 0 ? x : root(arr[x]);
	}
	bool same(T x, T y) {
		return root(x) == root(y);
	}
	bool unite(T x, T y) {
		x = root(x);
		y = root(y);
		if(x == y) return false;
		if(arr[x] > arr[y]) swap(x, y);
		arr[x] += arr[y];
		arr[y] = x;
		return true;
	}
	T size(T a) {
		return -arr[root(a)];
	}
}
