package;

//This lives on the server, the client proxys it.
class Api {
  public function new() { }

  public function foo(x : Int, y : Int) : Int {
    return x + y;
  }
}
