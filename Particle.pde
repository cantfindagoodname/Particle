import java.util.*;

PVector g = new PVector(0,1);
class particle {
    int h;
    PVector p, v;
    float r;
    color c;
    
    Vector<Trailing> trail = new Vector<Trailing>(512);
    
    // gravity :<PVector> g (0,+)
    particle(float _r, color col)  
    {                             
        p = new PVector((float)Math.random()* (width-1) + 1, (float)Math.random()* (height-1)+1); 
        v = new PVector((float)Math.random()*5+1, (float)Math.random()*5+1);
        r = _r;
        c = col;
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
        
        trail.add(new Trailing(p.x, p.y, r, c));
    }   
    
    void display()
    {
      fill(c);
      noStroke();
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
