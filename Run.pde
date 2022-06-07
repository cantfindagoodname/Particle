particle p[] =
{
  new particle(30, 50),
  new particle(20, 90),
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
