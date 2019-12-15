void main() {
	auto N = ri;
	auto calc = new Calculator;
	foreach(i; 0..N) {
		calc.run(rs);
	}
}

class Calculator {
	int[string] variables;
	int[][string] vectors;

	void run(string command) {
		auto args = command.chomp.split;
		switch(args[0]) {
			case "int":
				declare_int(args[1], eval_int(args[3..$]));
				break;
			case "vec":
				declare_vec(args[1], eval_vec(args[3..$]));
				break;
			case "print_int":
				writeln(eval_int(args[1..$]));
				break;
			case "print_vec":
				writefln("[%( %d %) ]", eval_vec(args[1..$]));
				break;
			default: break;
		}
	}

	int eval_int(string[] args) {
		int res = 0;
		int op = 1; // 1 => +, -1 => -, 0 => undefined
		int tmp = 0;

		foreach(v; args) {
			if(v == ";") break;
			switch(v) {
				case "+": op = 1; break;
				case "-": op = -1; break;
				default:
					debug writeln(v);
					if(v[0].isDigit) {
						tmp = v.to!int;
					} else tmp = variables[v];
					res += tmp * op;
					tmp = op = 0;
					break;
			}
		}
		return res;
	}

	int[] eval_vec(string[] args) {
		int[] res;
		int op = 1;
		int[] tmp;

		foreach(i, v; args) {
			if(v == ";") break;
			switch(v) {
				case "+": op = 1; break;
				case "-": op = -1; break;
				default:
					debug writeln(v);
					if(v[0] == "[") {
						
					}
			}
		}
		return res;
	}

	void declare_int(string name, int value) {
		variables[name] = value;
	}

	void declare_vec(string name, int[] value) {
		vectors[name] = value;
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