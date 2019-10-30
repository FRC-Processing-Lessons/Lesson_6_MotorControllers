class Robot extends ProcessingRobot{

  /* -----------------------------------------------------------------------------------
   * TODO 1:
   * Define your data fields down below.  I've created comments to suggest what devices
   * are needed.
   * -----------------------------------------------------------------------------------*/
   
  // Define a controller device here.  I think we'll be using Xbox controllers.
  
  
  // Define your motor controllers here.  Assume you'll need 4 Talon SRXs connected in 
  // CAN bus configuration.

  
  // You should group your motor controllers into comprehensible groupings.

  
  // Note, in FRC, you'll need to define a field for the DifferentialDrive as well, but for
  // the sake of the simulation here, you won't need to.
  
  public void robotInit(){
    /* -----------------------------------------------------------------------------------
     * TODO 2:
     * Initialize your new data fields here.  robotInit() is called once upon start-up.
     * -----------------------------------------------------------------------------------*/

    // Note: For the controller, you'll need to find the name of your device.  On my system, 
    // it's "Controller (Xbox One For Windows)"
  }
  
  public void teleopInit(){
    // Nothing here!
  }
  
  public void teleopPeriodic(){
    /* -----------------------------------------------------------------------------------
     * TODO 3:
     * This method is called periodically during operation for Teleop mode.  There should 
     * just be one line of code here!
     * -----------------------------------------------------------------------------------*/

  }

  /*------------------- Do not modify anything down below!  -------------------*/
  ControlIO control; // Not in a traditional FRC robot, just used for Processing inputs!
  
  public Robot(ControlIO control){
    super(new PVector(width/2, height/2), 100, 75);
    this.control = control;
    this.robotInit(); 
  }

}
