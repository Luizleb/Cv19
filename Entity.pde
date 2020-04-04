class Mover {

  int size;
  int status; // 0: healthy, 1: infected, 2: recovered
  int infecLimit;
  PVector location;
  PVector velocity;

  Mover(float x, float y) {
    size = 10;
    status = setStatus();
    if (status == 1) {
      infecLimit = infectedPeriod;
    } else {
      infecLimit=0;
    }
    location = new PVector(x, y);
    velocity = new PVector(random(-1, 1), random(-1, 1));
  }

  float distance(Mover m2) {
    return location.dist(m2.location);
  }

  int setStatus() {
    float threshold = 0.2 ;
    if (random(1)>threshold) {
      return  0;
    } else {
      return  1;
    }
  }

  void display() {
    noStroke();
    switch (status) {
    case 0:
      fill(0, 255, 0);
      break;
    case 1:
      fill(255, 0, 0);
      break;
    case 2:
      fill(100);
      break;
    }
    ellipse(location.x, location.y, size, size);
    updateInfected();
  }

  void move() {
    velocity = new PVector(random(-1, 1), random(-1, 1));
    location.add(velocity);
  }

  void limit(float w, float h) {
    if ((location.x <=-w/2) || (location.x>= w/2)) {
      velocity.x = - velocity.x;
    }
    if ((location.y <=-h/2) || (location.y>=h/2)) {
      velocity.y = - velocity.y;
    }
  }

  void updateInfected() {
    if (status == 1) {
      infecLimit = infecLimit - 1;
    }
  }

  void checkInfected() {
    if ((status == 1) &&(infecLimit <= 0)) {
      status = 2;
      infecLimit = 0;
    }
  }
}
