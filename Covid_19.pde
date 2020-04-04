// Simulation of an epidemic wave
// Based on : 
//
//
SecondApplet sa = new SecondApplet();
ArrayList<PVector> results;

// Main parameters
float distLimit = 30;
float transmissionRate = 0.40;
int infectedPeriod = 10000;

// Timer
int timeLastCheck = millis();
int timeInterval = 1500;
float timeCounter = 0;

System movers;

void settings() {
  size(1000, 1000);
  movers = new System(200);
}

void setup() {
  results = new ArrayList<PVector>();
  String[] args = {"TwoFrameTest"};
  PApplet.runSketch(args, sa);
}

void draw() {
  background(255);
  translate(width/2, height/2);
  movers.run();
  if (millis() > timeLastCheck + timeInterval ) {
    timeLastCheck = millis();
    float countHealthy = float(movers.countHealthy());
    float countInfected = float(movers.countInfected())/float(movers.getSize());
    results.add(new PVector(timeCounter*10,countHealthy));
    println("Total healthy :", countHealthy);
    println("Total infected :", countInfected);
    println("Total recovered :", 1 - countHealthy-countInfected);
    sa.evokedFromPrimary(results);
    timeCounter++;
  }
}
