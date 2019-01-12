void main() {
	auto ip = readAs!(int[]), N = ip[0], M = ip[1];
	auto p = readAs!(int[]);
	auto uf = new UnionFind!int(N);
	// Union Findは「つながっているか否か」を考えるときに使う
	// 今回は、例えばAとBが交換可能なことを「A ~ B」というとき
	// A ~ B かつ B ~ C ならば A ~ Cである。
	// だから、Union Findでこれを考えればよい。
	foreach(_; 0..M) {
		auto ip2 = readAs!(int[]);
		uf.unite(ip2[0]-1, ip2[1]-1); // A ~ B とする
		// ここで、uniteするとき、仮にA ~ B かつ B ~ Cという関係があったら
		// A ~ C という関係も成り立つようにさせている
	}
	int res;
	foreach(i; 0..N) {
		if(uf.root(p[i]-1) == uf.root(i)) res++;
		// pのi番目がiと交換できるならする。
	}
	res.writeln;
	// end


	/+alias Stack = Tuple!(int[], "arr", int, "index");
	auto ip = readAs!(int[]), N = ip[0], M = ip[1];
	auto p = readAs!(int[]);
	int[] x, y;
	foreach(i; 0..M) {
		auto ip2 = readAs!(int[]);
		x ~= ip2[0];
		y ~= ip2[1];
	}
	Stack[] stack;
	Stack[] history;
	foreach(i; 0..M) stack ~= Stack(p, i);
	int res;
	foreach(i; 0..N) {
		if(p[i] == i+1) {
			res++;
		}
	}
	while(stack.length) {
		auto i = stack.front;
		stack.popFront;
		auto a = i.arr;
		/*i.index.writeln;
		x.writeln;
		y.writeln;
		*/
		/*i.arr.write;
		"b".write;
		writeln(x[i.index],y[i.index]);
		*/
		swap(a[x[i.index]-1], a[y[i.index]-1]);
		//a.writeln;
		int tmp;
		foreach(k; 0..N) if(p[k] == k+1) tmp++;
		foreach(k; 0..M) {
			Stack n = Stack(a, k);
			if(!history.canFind(n)) {
				history ~= n;
				stack ~= n;
			}
		}
		//"%d, %d".writefln(x[i.index], y[i.index]);
		res = max(res, tmp);
	}
	res.writeln;
	+/
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
