Particle p[] =
{
  new Particle(100, 100, 30),
};

void setup()
{
  size(800,600);
}

void draw()
{
  background(60);
  for (Particle ins : p) {
    ins.update();
    ins.display();
  }
}
