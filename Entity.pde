class Mover {

  int size;
  int neighbours;
  boolean healthy;
  PVector location;
  PVector velocity;


  Mover(float x, float y) {
    size = 10;
    healthy = isHealthy();
    location = new PVector(x, y);
    velocity = new PVector(random(-1, 1), random(-1, 1));
  }

  float distance(Mover m2) {
    return location.dist(m2.location);
  }

  boolean isHealthy() {
    float threshold = 0.1 ;
    if (random(1)>threshold) {
      return healthy = true;
    } else {
      return healthy = false;
    }
  }

  void display() {
    noStroke();
    if (healthy) {
      fill(0, 255, 0);
    } else {
      fill(255, 0, 0);
    }
    ellipse(location.x, location.y, size, size);
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
}
