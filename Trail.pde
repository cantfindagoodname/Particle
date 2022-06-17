class Trailing {
  PVector p;
  float r, a;
  int counter, h;
  color c;
  
  float decay = 0.98;
  int frame = 256;
  
  Trailing(float x, float y, float rad, color col)
  {
    c = col;
    a = alpha(col);
    p = new PVector(x, y);
    r = rad;
    counter = frame;
  }
  
  void update()
  {
    if (a > 0)
      a -= 5;
    r *= decay;
    if (counter > 0)
      counter -= 1;
  }
  
  void display()
  {
    noStroke();
    fill(c, a);
    ellipse(p.x, p.y, r, r);
  }
}
