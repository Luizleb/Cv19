// Simulation of an epidemic wave
// Based on : 
//
//
SecondApplet sa = new SecondApplet();
ArrayList<PVector> ptsInfected;
ArrayList<PVector> ptsHealthy;

// Main parameters
int totalPopulation  = 300;
float distLimit = 40;
float transmissionRate = 0.60;
int infectedPeriod = 10000;

// Timer
int timeLastCheck = millis();
int timeInterval = 500;
float timeCounter = 0;

System movers;

void settings() {
  size(1000, 1000);
  movers = new System(totalPopulation);
}

void setup() {
  ptsInfected = new ArrayList<PVector>();
  ptsHealthy = new ArrayList<PVector>();
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
    float countInfected = float(movers.countInfected());
    ptsInfected.add(new PVector(timeCounter,sa.height-map(countInfected,0,totalPopulation,0,sa.height)));
    ptsHealthy.add(new PVector(timeCounter,sa.height-map(countHealthy,0,totalPopulation,0,sa.height)));
    sa.evokedFromPrimary(ptsInfected,ptsHealthy);
    timeCounter++;
  }
}
