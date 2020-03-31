System movers;
float distLimit = 20;

void setup() {
  size(600, 600);
  movers = new System(100);
}

void draw() {
  background(255);
  translate(width/2, height/2);
  listNeighbours();
  movers.run();
  if(millis() % 1000 == 0 ){
    println("Total healthy :",float(movers.countHealthy())/float(movers.getSize())); 
  }
}

void listNeighbours() {
  for (int i=0; i<movers.getSize(); i++) {
    Mover curMover = movers.getMover(i);
    ArrayList neighbours = movers.getNeighbours(curMover);
    if (neighbours.size() >= 1 ){
      handleNeighbours(curMover, neighbours);
    };
  }
}

void handleNeighbours(Mover cm, ArrayList<Mover> list) {
  for (Mover mv : list) {
    // the current mover is healthy
    if (cm.healthy) {
      if (!mv.healthy) { 
        cm.healthy = false;
      }
    } else { // the current mover is not healthy
      if (mv.healthy) {
        mv.healthy = false;
      }
    }
  }
}
