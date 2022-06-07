Particle p[] =
{
  new Particle(30, 50),
  new Particle(20, 90),
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
