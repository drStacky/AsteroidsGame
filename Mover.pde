abstract class Mover {
  PVector location, velocity;
  float angle;
  float[] vertices;
  
  Mover() {
    // Blank constructor
    location = new PVector(0, 0);
    velocity = new PVector(0, 0);
    angle = 0;
    vertices = new float[2];
  }
   
  void update() {
    location.add(velocity);
  }
  
  void checkEdges() {
    if(location.x < 0) location.x = width;
    if(location.x > width) location.x = 0;
    if(location.y < 0) location.y = height;
    if(location.y > height) location.y = 0;
  }
  
  void drawMover() {
    beginShape();
    for(int i=0; i<vertices.length - 1; i+=2)
      vertex(vertices[i], vertices[i+1]); 
    endShape(CLOSE);
  }
  
  boolean collidesWith(Mover m) {
    
    for(int i=0; i<m.vertices.length - 1; i += 2) {
      for(int j=0; j < this.vertices.length - 1; j += 2) {
        PVector myVertex1 = new PVector(this.vertices[j], this.vertices[j+1]);
        int k = (j+2) % (this.vertices.length); // Allows checking last vertex with first
        PVector myVertex2 = new PVector(this.vertices[k], this.vertices[k+1]);
        PVector myVertex3 = new PVector(m.vertices[i], m.vertices[i+1]);
        
        // location of this corner 1
        myVertex1.add(this.location);
        // locaiton of this corner 2
        myVertex2.add(this.location);
        // location of mover corner
        myVertex3.add(m.location);
        
        // Unit vectors representing side of triangle
        PVector side1 = myVertex1.copy().sub(myVertex2).normalize();
        PVector side2 = myVertex1.copy().sub(myVertex3).normalize();
        PVector side3 = myVertex2.copy().sub(myVertex3).normalize();
        
        // Dot product is cosine of angles between vectors
        // If mover is close to edge, cos(angle) is close to one
        if((side2.dot(side1) >= 0.99) &&
           (side3.dot(side1) <= -0.99))
             return true;
      }
    }
    
    return false;
  }
}