// Simulation of an epidemic wave
// Based on : 
//
//

// Main parameters
float distLimit = 30;
float transmissionRate = 0.40;
int infectedPeriod = 10000;

// Timer
int timeLastCheck = millis();
int timeInterval = 1500;

System movers;

void settings() {
  size(1000, 1000);
  movers = new System(200);
}

void setup() {
  //size(1000, 1000);
  //movers = new System(200);
  String[] args = {"TwoFrameTest"};
  SecondApplet sa = new SecondApplet();
  PApplet.runSketch(args, sa);
  sa.evokedFromPrimary(500);
}

void draw() {
  background(255);
  translate(width/2, height/2);
  movers.run();
  if (millis() > timeLastCheck + timeInterval ) {
    timeLastCheck = millis();
    float countHealthy = float(movers.countHealthy())/float(movers.getSize());
    float countInfected = float(movers.countInfected())/float(movers.getSize());
    println("Total healthy :", countHealthy);
    println("Total infected :", countInfected);
    println("Total recovered :", 1 - countHealthy-countInfected);
  }
}
