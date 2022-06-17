particle p[] =
{
  new particle(30, color(100, 255, 0, 255)),
  new particle(20, color(255, 0, 0, 255)),
};

void setup()
{
  size(800,600);
}

void draw()
{
  background(60);
  for (particle ins : p) {
    ins.update();
    ins.display();
  }
}
