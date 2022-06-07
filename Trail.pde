class Trailing {
  PVector p;
  float r;
  int counter, a, h;
  
  float decay = 0.98;
  int frame = 256;
  
  Trailing(float x, float y, float rad, int hue)
  {
    h = hue;
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
    fill(h, a);
    ellipse(p.x, p.y, r, r);
  }
}
