import std.stdio;
int[int[2]] current_board;
bool[int[2]] sum_board;
int[int[2]] next_board;
int DIE=0;
int LIVE=1;
int MAKE=2;
int get(int[int[2]] arr,int[2] index)
{
  try { return arr[index]; }
  catch { return 0; }
}
int[2][] cells_around(int[2] cell)
{
  int[2][] r;
  foreach(i;[-1,0,1]){
    foreach(j;[-1,0,1]){
      if(i!=0||j!=0)
      {
        r~=[cell[0]+i,cell[1]+j];
      }
    }
  }
  return r;
}
int[2][] alive_cells() //The alive cells in current_board, a.k.a. the ones that are not 0
{
  int[2][] r;
  foreach(i;current_board)
  {
    if(current_board[i] < 0)
    {
      assert(false);
    }
    else if(current_board[i] == 0)
    {
      //Dead cell
    }
    else
    {
      r~=i;
    }
  }
  return r;
}
void sum_around(int[2] cell)
{
  foreach(i;cells_around(cell))
  {
    sum_board[i]=get(sum_board,i) + 1 ;
  }
}
bool has(T)(T[] arr,T item)
{
  foreach(i;arr)
  {
    if(i==item)
    {
      return true;
    }
  }
  return false;
}
int[2][] to_update()
{
  int[2][] r;
  int[2][] u=alive_cells();
  foreach(i;u)
  {
    foreach(j;cells_around(i)~u)
    {
      if(!has(r,j))
      {
        r~=j;
      }
    }
  }
  return r;
} //Slow as heck!
void populate_sum()
{
  foreach(i;to_update())
  {
    sum_around(i);
  }
}
