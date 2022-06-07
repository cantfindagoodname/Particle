class Trailing {
  PVector p;
  float r;
  int counter, a;
  
  float decay = 0.98;
  int frame = 256;
  
  Trailing(float x, float y, float rad)
  {
    a = 255;
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
    fill(127, a);
    ellipse(p.x, p.y, r, r);
  }
}
