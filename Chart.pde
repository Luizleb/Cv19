
public class SecondApplet extends PApplet {
  
  Float test;
  ArrayList<PVector> points;

  public void settings() {
    size(800, 800);
  }
  public void draw() {
    background(255);
    fill(0,0,255);
    textSize(20);
    text("The number is : "+test,100,100);
  }
  
  void evokedFromPrimary(ArrayList<PVector> list){
    for(PVector pt : list){
    test = pt.y;
    }
    
  }
  
}
