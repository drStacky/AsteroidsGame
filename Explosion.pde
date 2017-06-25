class Explosion {
  PVector location;
  
  Explosion() {
    location = new PVector(-100, -100);
  }
  
  void display() {
    pushMatrix();
    translate(location.x, location.y);
    fill(random(150, 255), random(150, 255), 0);
    triangle(0, 10, 30, 40, 60, 10);
    triangle(0, 30, 30, 0, 60, 30);
    
    scale(0.5);
    translate(30, 20);
    fill(random(150, 255), random(50, 150), 0);
    triangle(0, 10, 30, 40, 60, 10);
    triangle(0, 30, 30, 0, 60, 30);
    
    scale(0.5);
    translate(30, 20);
    fill(random(150, 255), 0, 0);
    triangle(0, 10, 30, 40, 60, 10);
    triangle(0, 30, 30, 0, 60, 30);
    popMatrix();
  }
}