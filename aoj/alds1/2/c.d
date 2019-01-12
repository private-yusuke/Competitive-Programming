struct Card {
	char pat;
	int num;

	string toString() {
		return pat ~ num.to!string;
	}
}

Card[] bubbleSort(Card[] cards) {
	ulong N = cards.length;
	foreach(i; 0..N) foreach_reverse(j; i+1..N) {
		if(cards[j].num < cards[j-1].num) swap(cards[j], cards[j-1]);
	}
	return cards;
}

Card[] selectionSort(Card[] cards) {
	ulong N = cards.length;
	foreach(i; 0..N) {
		ulong minj = i;
		foreach(j; i..N) {
			if(cards[j].num < cards[minj].num) minj = j;
		}
		swap(cards[i], cards[minj]);
	}
	return cards;
}

void main() {
	auto N = ri;
	Card[] cards;
	auto S = readln.split;
	foreach(i; S) {
		cards ~= Card(i[0], i[1].to!string.to!int);
	}
	// Bubble sort is always stable
	auto A = cards.dup.bubbleSort;
	writefln("%(%s %)\nStable", A);
	auto B = cards.dup.selectionSort;
	writefln("%(%s %)", B);
	writeln(A == B ? "Stable" : "Not stable");
}

// ===================================

import std.stdio;
import std.string;
import std.functional;
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