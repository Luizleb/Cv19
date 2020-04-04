

public class SecondApplet extends PApplet {
  
  float test;

  public void settings() {
    size(800, 800);
  }
  public void draw() {
    background(255);
    fill(0);
    ellipse(test, 50, 50, 50);
  }
  
  void evokedFromPrimary(float x){
    test = x;
  }
}
