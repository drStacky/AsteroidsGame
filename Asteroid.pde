class Asteroid extends Mover {
  float maxSpeed = 1, epsilon = 10;
  color fillColor = color(0, random(0, 150), random(150, 255));
  
  Asteroid(float minR, float maxR) {
    location = new PVector(random(width), random(height));
    velocity = new PVector(random(-maxSpeed, maxSpeed),
                           random(-maxSpeed, maxSpeed));
                           
    vertices = new float[12];
    vertices[0] = 0 + random(-epsilon, epsilon);
    vertices[1] = 0 + random(-epsilon, epsilon); 
    vertices[2] = -10 + random(-epsilon, epsilon);
    vertices[3] = 20 + random(-epsilon, epsilon);
    vertices[4] = 0 + random(-epsilon, epsilon);
    vertices[5] = 40 + random(-epsilon, epsilon);
    vertices[6] = 30 + random(-epsilon, epsilon);
    vertices[7] = 40 + random(-epsilon, epsilon);
    vertices[8] = 40 + random(-epsilon, epsilon);
    vertices[9] = 20 + random(-epsilon, epsilon);
    vertices[10] = 30 + random(-epsilon, epsilon);
    vertices[11] = 0 + random(-epsilon, epsilon);
  }
  
  void display() {
    noStroke();
    fill(fillColor);
    
    pushMatrix();
    translate(location.x, location.y);
    drawMover();
    popMatrix();
  }
}