import java.util.*;

Ship myShip;
ArrayList<Shot> myShots;
ArrayList<Asteroid> myAsteroids;
Explosion myExplosion;
int initNumAst = 5;
int numAst = initNumAst;
int numAstLevelUp = 3;
float expWait = 0, shipWait = 0;
int level = 1;
int maxLevel = 1;

void setup() {
  size(600, 600);
  smooth();
  
  myShip = new Ship();
  myShots = new ArrayList<Shot>();
  resetAsteroids(initNumAst);
  myExplosion = new Explosion();
}

void resetAsteroids(int n) {
  myAsteroids = new ArrayList<Asteroid>();
  for(int i=0; i < n; i++)
    myAsteroids.add(new Asteroid(10, 20));
}

void draw() {
  background(0);
  textAlign(CENTER);
  textSize(24);
  fill(255);
  text("ASTEROIDS", width / 2, 30);
  textSize(16);
  text("by Matt Stackpole", width / 2, 60);
  text("Level " + level, width / 2, 90);
  textAlign(RIGHT);
  text("Best Level: " + maxLevel, width - 30, 30);
  
  // Move ship
  if(millis() - shipWait > 500) myShip.update();
  myShip.checkEdges();
  myShip.display();
  
  // Move shots
  for(Shot shot: myShots) {
    shot.update();
    shot.display();
  }
  
  // Move asteroids and check for hits
  Iterator<Asteroid> asterIter = myAsteroids.iterator();
  while(asterIter.hasNext()) {
    Asteroid a = asterIter.next();
    
    // Move asteroid
    a.update();
    a.checkEdges();
    a.display();
    
    // If hit by ship, reset ship
    if(a.collidesWith(myShip) && (millis() - shipWait > 1000)) {
      myExplosion.location = myShip.location.copy();
      expWait = millis();
      shipWait = millis();
      myShip.location = new PVector(width / 2, height / 2);
      level = 1;
      numAst = initNumAst;
      resetAsteroids(initNumAst);
    }
    
    // If hit by shot, remove shot and asteroid
    Iterator<Shot> shotIter = myShots.iterator();
    while(shotIter.hasNext()) {
      Shot shot = shotIter.next();
      if(a.collidesWith(shot)) {
          // Signifies asteroid has been hit
          myExplosion.location = a.location.copy();
          expWait = millis();
          asterIter.remove();
          // Remove shot from list (and screen)
          shotIter.remove();
      }
    }
  }
  
  
  
  // Show explosion within 0.3 seconds of being hit
  if(millis() - expWait < 300) myExplosion.display();

  // Level up if all asteroids destroyed
  if(myAsteroids.size() == 0) {
    level++;
    maxLevel = max(level, maxLevel);
    numAst += numAstLevelUp;
    resetAsteroids(numAst);
  }
}

void mousePressed() {
  myShots.add(new Shot(myShip));
}