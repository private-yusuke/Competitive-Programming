import std.stdio;

void main() {
	string input = readln();
	int count;
	foreach(char c; input) {
		if(c == '1') count++;
	}
	writeln(count);
}
