class Robot extends ProcessingRobot{
 
  ControlIO control; // Not in a traditional FRC robot, just used for Processing inputs!
  XboxController xbox;
  
  public void robotInit(){
    
  }
  
  public void teleopInit(){
    
  }
  
  public void teleopPeriodic(){
    
    
  }

  
  public Robot(ControlIO control){
    super(new PVector(width/2, height/2), 100, 75);
    this.control = control;
    this.robotInit(); 
    
  }

}
