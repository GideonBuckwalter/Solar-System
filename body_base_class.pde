public class Body {
  
  PVector position;
  PVector velocity;
  PVector netForce;
  float mass;
  final float G = 6.67e-11;
  
  Body(PVector pos, PVector vel, float m) {
     position = pos;
     velocity = vel;
     netForce = new PVector(0, 0, 0);
     mass = m;
  }
  
  public void update() {
     final float dt = 0.01;
     PVector dx;
     PVector dv;
     PVector acc;
     
     // v = dx/dt
     // delta-position = velocity * delta-time
     dx = PVector.mult(velocity, dt);
     position.add(dx);
     
     // f = ma
     acc = PVector.div(netForce, mass);
     
     // same logic as above
     dv = PVector.mult(acc, dt);
     velocity.add(dv);
     
     // zero out netForce
     netForce = new PVector(0, 0, 0);
  }
}