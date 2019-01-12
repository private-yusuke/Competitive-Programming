import std.stdio;
import std.string;
import std.conv;
import std.algorithm;
import std.range;
import std.traits;
import std.math;
import std.conv;
import std.typecons;

int n, W;
int[] w, v;
int[][] dp;

void main()
{
	n = 4;
	w = [21
	, 1, 3, 2];
	v = [3, 2, 4, 2];
	W = 5;
	dp = new int[][](n+1, W+1);
	foreach(i; 0..n+1) {
		dp[i][] = -1;
	}
	rec(0, W).writeln; // 0番目以降(すなわちすべての荷物)の荷物を重さWのナップサックに入れたときの価値の最大値
}

/*
* i番目以降の荷物を重さj制限のナップサックに入れる
* 実質、この関数を呼ぶたびにi番目の荷物を入れるか否かを考えているだけ。
*/
int rec(int i, int j) {
	if(dp[i][j] >= 0) return dp[i][j]; // でぃーぴー( ᐛ)
	// まず最初に、iがn以上なら何も入るものがないので価値は0
	if(i == n) res = 0;
	// i番目の荷物が重すぎて入らない場合(下のmaxの第二引数のdpの第二添字が0より小さくなる場合)
	else if(j < w[i]) res = rec(i + 1, j);
	// i番目の荷物は入ります！！！！さぁ、入れるか否か、どっちのほうが価値が高くなるでしょうか。
	else res = max(rec(i + 1, j), rec(i + 1, j - w[i] + v[i]));
	return dp[i][j] = res;
}