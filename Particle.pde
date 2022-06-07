import java.util.*;

PVector g = new PVector(0,1);
class Particle {
    int h;
    PVector p, v;
    float r;
    
    Vector<Trailing> trail = new Vector<Trailing>(512);
    
    // gravity :<PVector> g (0,+)
    Particle(float _r, int hue)  
    {                             
        h = hue;
        p = new PVector((float)Math.random()* (width-1) + 1, (float)Math.random()* (height-1)+1); 
        v = new PVector((float)Math.random()*5+1, (float)Math.random()*5+1);
        r = _r;
    }   

    void update() 
    {   
        p.add(v);
        p.add(g);

        if (p.x  > width - r)  {
          p.x = width - r;
          v.x = -abs(v.x);
        }
        else if (p.x  < r)  {
          p.x = r;
          v.x = abs(v.x);
        }
        else if (p.y  > height - r)  {
          p.y = height - r;
          v.y = -abs(v.y);
        }
        else if (p.y  < r)  {
          p.y = r;
          v.y = abs(v.y);
        }
        
        trail.add(new Trailing(p.x, p.y, r, h));
    }   
    
    void display()
    {
      noStroke();
      fill(h);
      ellipse(p.x, p.y, r, r);
      
      for (Trailing t: trail) {
        t.update();
        t.display();
      }
      if (trail.get(0).counter == 0) {
          trail.remove(0);
      }
    }
    
    void v_inc(float x, float y)
    {
      v.add(x, y);
    }
    
    void r_inc(float f)
    {
      r += f;
    }
}

// Verlet
