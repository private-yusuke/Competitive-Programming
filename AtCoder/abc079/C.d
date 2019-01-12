import std.stdio, std.conv, std.string;

void main() {
	string input = chomp(readln());
	int[4] i;
	for(int j = 0; j < 4; j++) {
		i[j] = to!int(input[j]);
	}
	int a=i[0]-48, b=i[1]-48, c=i[2]-48, d=i[3]-48;
	
	if(a+b+c+d==7) writefln("%d+%d+%d+%d=7", a, b, c, d);
	else if(a+b+c-d==7) writefln("%d+%d+%d-%d=7", a, b, c, d);
	else if(a+b-c+d==7) writefln("%d+%d-%d+%d=7", a, b, c, d);
	else if(a+b-c-d==7) writefln("%d+%d-%d-%d=7", a, b, c, d);
	else if(a-b+c+d==7) writefln("%d-%d+%d+%d=7", a, b, c, d);
	else if(a-b+c-d==7) writefln("%d-%d+%d-%d=7", a, b, c, d);
	else if(a-b-c+d==7) writefln("%d-%d-%d+%d=7", a, b, c, d);
	else if(a-b-c-d==7) writefln("%d-%d-%d-%d=7", a, b, c, d);
}
