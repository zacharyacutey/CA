import std.stdio;

class DefaultDict(T,U) //T=>U AKA U[T]
{
  public U[T] val;
  this()
  {
  }
  public U opIndex(T arg)
  {
    if(arg in this.val)
    {
      return this.val[arg];
    }
    else
    {
      return U.init;
    }
  }
  public void opIndexAssign(T arg,U v)
  {
    if(U == U.init)
    {
    }
    else
    {
      this.val[arg] = v;
    }
  }
}
void main(){}

