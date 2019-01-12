import std.stdio;
import std.string;
import std.conv;
import std.algorithm;
import std.range;
import std.traits;
import std.math;
import std.conv;
import std.typecons;
import std.uni;
import std.ascii;
import std.bitmanip;
import core.bitop;

int N;
int[] dp;
void main() {
	N = ri;
	dp = new int[](N + 1);
	dp[] = -1; // still not calculatedなところ
	dp[1] = 1; // 1マス目は移動数が1

	int[] q = [1]; // キュー
	while(q.length) {
		int j = q[0];
		q.popFront;
		int bits = j.popcnt;
		// 後ろに動こうとしたとき1マス目より前に行かない かつ 計算されてないとき
		if(j - bits >= 1 && dp[j - bits] < 0) {
			dp[j - bits] = dp[j] + 1; // 後ろに移動
			q ~= j - bits; // キュー追加
		}
		// 前に動こうとしたときゴールのマスより後ろに行かない かつ 計算されていないとき
		if(j + bits <= N && dp[j + bits] < 0) {
			dp[j + bits] = dp[j] + 1; // 前に移動
			q ~= j + bits; // キュー追加
		}
		dp.writeln;
	}
	dp[N].writeln;
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

double rd() {
	return readAs!double;
}

string rs() {
	return readln.chomp;
}