/*----------------------------------------------------------------------------*/
/* Copyright (c) 2019 Shichao Liang. All Rights Reserved.                     */
/* Open Source Software - may be modified and shared by FRC teams. The code   */
/* must be accompanied by the MIT license file in the root directory of       */
/* the project.                                                               */
/*----------------------------------------------------------------------------*/
/* ProcessingRobot base for Processing FRC Simulation Lessons                 */
/*----------------------------------------------------------------------------*/

/**
 * Processing Robot is a substitute for Robot Base for the Processing simulation
 * environment.  This is very feature-sparse, and does not support the full
 * range of functionality included in Robot Base.
 */
public class ProcessingRobot{
  
  PVector velocity;
  PVector position;
  float angle;
  int robotWidth;
  int robotHeight;
  public DifferentialDrive drive;
  
  /**
   * Environment-specific initalization for the robot.
   * @param initialPosition PVector for the inital position of the robot on-canvas.
   * @param w Width of the robot on-canvas.
   * @param h Height of the robot on-canvas.
   */
  public ProcessingRobot(PVector initialPosition, int w, int h){
    this.velocity = new PVector(0,0);
    this.position = initialPosition;
    this.robotWidth = w;
    this.robotHeight = h;
    this.angle = 0;
    drive = null;
  }
  
  /**
   * Shows the robot on the canvas after calculating moves.
   */
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
  
  /**
   * Moves the robot according to inputs, but only if the drive has been initialized.
   */
  public void move(){
    if(drive != null){
      float x = (float) drive.xSlider;
      System.out.println("X: "+x);
      float y = (float) drive.ySlider;
      PVector newHeading = (new PVector(x, y));
      float magnitude = newHeading.y*4;
      this.angle += newHeading.x/20;
      this.velocity = PVector.fromAngle(this.angle+PI/2);
      this.velocity.setMag(magnitude);
    }
    else{
      System.out.println("No drive element initialized!"); 
    }
    
    this.position = this.position.add(this.velocity);  
  }
  
  
}
