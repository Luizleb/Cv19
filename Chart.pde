
public class SecondApplet extends PApplet {

  Float test;
  ArrayList<PVector> points;

  public void settings() {
    size(800, 800);
    points = new ArrayList<PVector>();
  }

  public void draw() {
    background(255);
    //fill(0,0,255);
    //textSize(20);
    //text("The number is : "+test,100,100);
    displayShape(points);
  }

  void displayShape(ArrayList<PVector> list) {
    stroke(0);
    fill(0, 0, 255);
    beginShape();
    for (int i=0; i<list.size(); i++) {
      vertex(list.get(i).x, list.get(i).y);
    }
    vertex(list.get(list.size()-1).x,0);
    endShape();
  }

  void evokedFromPrimary(ArrayList<PVector> list) {
    points = list;
  }
}
