
public class SecondApplet extends PApplet {

  Float test;
  ArrayList<PVector> ptsInfected;
  ArrayList<PVector> ptsHealthy;

  public void settings() {
    size(1200, 800);
    ptsInfected = new ArrayList<PVector>();
    ptsHealthy = new ArrayList<PVector>();
  }

  public void draw() {
    background(255);
    //fill(0,0,255);
    //textSize(20);
    //text("The number is : "+test,100,100);
    stroke(255,0,0);
    strokeWeight(3);
    displayShape(ptsInfected);
    stroke(0,255,0);
    displayShape(ptsHealthy);
  }

  void displayShape(ArrayList<PVector> list) {
    beginShape();
    for (int i=0; i<list.size(); i++) {
      vertex(list.get(i).x, list.get(i).y);
    }
    endShape();
  }

  void evokedFromPrimary(ArrayList<PVector> list1, ArrayList<PVector> list2) {
    ptsInfected = list1;
    ptsHealthy = list2;
  }
}
