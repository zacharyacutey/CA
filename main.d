import std.stdio;
//import std.variant;alias var = Variant;
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ Might need this.
int[int[2]] clean;
int[int[2]] current_board;
int[int[2]] sum_board;
int[int[2]] next_board;
void display()
{
  foreach(key,value;current_board)
  {
    write("(");write(key[0]);write(",");write(key[1]);write(")=>");writeln(value);
  }
}
void clear()
{
  current_board=next_board;
  next_board=clean.dup;
  sum_board=clean.dup;
}
void main(){}

