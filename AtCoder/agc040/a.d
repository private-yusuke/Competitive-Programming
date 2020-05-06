void main()
{
    auto S = rs;
    auto ltarr = new int[](S.length); // <
    auto gtarr = new int[](S.length); // >

    ltarr[0] = S[0] == '<' ? 1 : 0;
    foreach (i; 1 .. S.length)
    {
        if (S[i] == '<')
            ltarr[i] = ltarr[i - 1] + 1;
        else
            ltarr[i] = 0;
    }

    gtarr[$ - 1] = S[$ - 1] == '>' ? 1 : 0;
    foreach_reverse (i; 0 .. S.length - 1)
    {
        if (S[i] == '>')
            gtarr[i] = gtarr[i + 1] + 1;
        else
            gtarr[i] = 0;
    }
    debug gtarr.writeln;
    debug ltarr.writeln;

    ulong res;
    res += gtarr[0];
    foreach (i; 1 .. S.length)
    {
        res += max(ltarr[i - 1], gtarr[i]);
    }
    res += ltarr[$ - 1];
    res.writeln;
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

T readAs(T)() if (isBasicType!T)
{
    return readln.chomp.to!T;
}

T readAs(T)() if (isArray!T)
{
    return readln.split.to!T;
}

T[][] readMatrix(T)(uint height, uint width) if (!isSomeChar!T)
{
    auto res = new T[][](height, width);
    foreach (i; 0 .. height)
    {
        res[i] = readAs!(T[]);
    }
    return res;
}

T[][] readMatrix(T)(uint height, uint width) if (isSomeChar!T)
{
    auto res = new T[][](height, width);
    foreach (i; 0 .. height)
    {
        auto s = rs;
        foreach (j; 0 .. width)
            res[i][j] = s[j].to!T;
    }
    return res;
}

int ri()
{
    return readAs!int;
}

long rl()
{
    return readAs!long;
}

double rd()
{
    return readAs!double;
}

string rs()
{
    return readln.chomp;
}
