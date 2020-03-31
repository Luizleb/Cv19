class System {

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
    };
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
      if (m.healthy) {
        counter++;
      }
    }
    return counter;
  }
}
