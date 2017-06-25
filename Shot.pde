class Shot extends Mover{
  float speed = 5, xDist;
  color shotColor;
  
  Shot(Ship _ship) {
    location = _ship.location.copy();
    angle = _ship.angle;
    xDist = mouseX - location.x;
    shotColor = color(255, 255, 0);
    velocity = new PVector((float)Math.cos(angle),
                           (float)Math.sin(angle));
    velocity.mult(speed);
    
    vertices = new float[4];
    vertices[0] = 0;
    vertices[1] = 5;
    vertices[2] = 0;
    vertices[3] = 20;
  }
  
  void display() {
    stroke(shotColor);
    strokeWeight(10);
    
    pushMatrix();
    translate(location.x, location.y);
    rotate(angle - PI / 2);
    drawMover();
    popMatrix();
  }
}