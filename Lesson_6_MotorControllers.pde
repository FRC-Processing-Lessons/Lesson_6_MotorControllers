import org.gamecontrolplus.*;

Robot myRobot;
ControlIO control;
XboxController xbox;


void setup(){
  size(1000, 800);
  background(0,0,0);
  myRobot = new Robot(control);
  control = ControlIO.getInstance(this);
  xbox = new XboxController("Controller (Xbox One For Windows)", control);
  
}

void draw(){
  background(0,0,0);
  myRobot.teleopPeriodic();
  myRobot.show();
  float x = (float) xbox.getX(Hand.kLeft);
  float y = (float) xbox.getY(Hand.kLeft);
  System.out.println("X: "+x);
  System.out.println("Y: "+y);
  myRobot.setVelocity(new PVector(x, y));
}
