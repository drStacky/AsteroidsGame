class Ship extends Mover{
  PVector acceleration;
  float maxSpeed, xDist, yDist;
  
  Ship() {
    location = new PVector(width / 2, height / 2);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    angle = 0;
    maxSpeed = 3;
    xDist = 0;
    yDist = 0;
    
    vertices = new float[8];
    vertices[0] = 0;
    vertices[1] = 30;
    vertices[2] = 10;
    vertices[3] = 0;
    vertices[4] = 0;
    vertices[5] = 5;
    vertices[6] = -10;
    vertices[7] = 0;
  }
  
  void update() {
    xDist = mouseX - location.x;
    yDist = mouseY - location.y;
    
    angle = atan2(yDist, xDist);
    
    // Accelerate inversely to distance from mouse
    float accX = map(xDist, -width, width, -1, 1);
    float accY = map(yDist, -height, height, -1, 1);
    
    acceleration.x = accX;
    acceleration.y = accY;
    
    velocity.add(acceleration);
    location.add(velocity);
    
    // Limit ship speed
    velocity.x = constrain(velocity.x, -maxSpeed, maxSpeed);
    velocity.y = constrain(velocity.y, -maxSpeed, maxSpeed);
  }
  
  void display() {
    noStroke();
    fill(255);
    
    pushMatrix();
    translate(location.x, location.y);
    rotate(angle - PI/2);
    drawMover();
    popMatrix();
  }
  

}