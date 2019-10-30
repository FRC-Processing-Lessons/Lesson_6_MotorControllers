
public class ProcessingRobot{
  
  PVector velocity;
  PVector position;
  float angle;
  int robotWidth;
  int robotHeight;
  
  public ProcessingRobot(PVector initialPosition, int w, int h){
    this.velocity = new PVector(0,0);
    this.position = initialPosition;
    this.robotWidth = w;
    this.robotHeight = h;
    this.angle = 0;
  }
  
  public void show(){
    this.move();
    rectMode(CENTER);
    fill(255,255,255);
    pushMatrix();
    translate(position.x, position.y);
    rotate(angle);
    rect(0, 0, robotWidth, robotHeight);
    popMatrix();
  }
  
  public void move(){
    this.position = this.position.add(this.velocity);  
  }
  
  public void setVelocity(PVector newVelocity){
    //this.velocity = newVelocity;
    //this.velocity.normalize();
    //this.velocity.mult(3);
    this.angle += newVelocity.x/20;
  }
  
}
