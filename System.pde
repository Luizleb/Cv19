class System { //<>// //<>//

  ArrayList<Mover> movers;  // list of movers

  System(int n) {
    movers = new ArrayList<Mover>();
    for (int i=0; i<n; i++) {
      movers.add(new Mover(random(-width/2, width/2), random(-height/2, height/2)));
    }
  }

  Mover getMover(int i) {
    return movers.get(i);
  }

  int getSize() {
    return movers.size();
  }

  void run() {
    for (Mover m : movers) {
      m.display();
      m.move();
      m.limit(width, height);
      m.updateInfected();
      m.checkInfected();
    }
    handleNeighbours();
    //checkRecovered();
  }

  void handleNeighbours() {
    for (int i=0; i<movers.size(); i++) {
      Mover curMover = movers.get(i);
      ArrayList neighbours = getNeighbours(curMover);
      if (neighbours.size() >= 1 ) {
        checkNeighbours(curMover, neighbours);
      };
      neighbours.clear();
    }
  }

  void checkRecovered() {
    for (Mover mv : movers) {
      if ((mv.status==1) && (mv.infecLimit <10)) {
        mv.status = 2;
        mv.infecLimit = 0;
      }
    }
  }

  void checkNeighbours(Mover cm, ArrayList<Mover> list) {
    for (Mover mv : list) {
      // the current mover is healthy
      if (cm.status == 0) {
        if (mv.status == 1) { 
          if (random(1)<transmissionRate) {
            cm.status = 1;
            cm.infecLimit =infectedPeriod;
          }
        }
      } else if (cm.status == 1) { // the current mover is not healthy
        if (mv.status == 0) {
          if (random(1)<transmissionRate) {
            mv.status = 1;
            mv.infecLimit =infectedPeriod;
          }
        }
      }
    }
  }

  ArrayList getNeighbours(Mover m1) {
    ArrayList<Mover> neigh = new ArrayList<Mover>();
    for (Mover m2 : movers) {
      if ((m1.distance(m2) < distLimit) && (m1 != m2)) {
        neigh.add(m2);
      }
    }
    return neigh;
  }

  int countHealthy() {
    int counter = 0;
    for (Mover m : movers) {
      if (m.status == 0) {
        counter++;
      }
    }
    return counter;
  }

  int countInfected() {
    int counter = 0;
    for (Mover m : movers) {
      if (m.status == 1) {
        counter++;
      }
    }
    return counter;
  }
}
