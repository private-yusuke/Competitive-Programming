import std.stdio;
import std.string;
import std.conv;
import std.algorithm: canFind;

void main() {
	string[] inputs = split(readln());
	int x = to!int(inputs[0]);
	int y = to!int(inputs[1]);
	
	int res_x = group(x);
	int res_y = group(y);
	if(res_x == res_y) "Yes".writeln;
	else "No".writeln;
}

ubyte group(int a) {
	switch(a) {
		case 1,3,5,7,8,10,12:
			return 0;
		case 4,6,9,11:
			return 1;
		case 2:
			return 2;
		default:
			return 3;
	}
}
