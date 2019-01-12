    import std.stdio;
    import std.string;
    import std.conv;
     
    void main() {
    	string input = readln();
    	char X = input[0];
    	char Y = input[2];
    	
    	if(X < Y) writeln("<");
    	else if(X > Y) writeln(">");
    	else writeln("=");
    }
