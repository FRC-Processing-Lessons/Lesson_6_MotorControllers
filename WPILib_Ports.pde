/*----------------------------------------------------------------------------*/
/* Copyright (c) 2016-2019 FIRST. All Rights Reserved.                        */
/* Open Source Software - may be modified and shared by FRC teams. The code   */
/* must be accompanied by the FIRST BSD license file in the root directory of */
/* the project.                                                               */
/*----------------------------------------------------------------------------*/
/* Modified for Processing by Michael Liang for FRC Team 1648                 */
/*----------------------------------------------------------------------------*/

import org.gamecontrolplus.*;

class SpeedControllerGroup{

  private final SpeedController[] groupControllers;
  private boolean isInverted;
  
  /**
   * Create a new SpeedControllerGroup with the provided SpeedControllers.
   * @param speedControllers The SpeedControllers to add
   */
  public SpeedControllerGroup(SpeedController... speedControllers){
    this.groupControllers = new SpeedController[speedControllers.length];
    for(int i = 0; i<speedControllers.length; i++){
      groupControllers[i] = speedControllers[i];
    }
    this.isInverted = false;
  }
    
  /**
   * Sets the speed for all speed controllers within the group.
   * @param speed The target speed (double) 
   */
  public void set(double speed){
    for(SpeedController sc : this.groupControllers){
      sc.set( (isInverted)? -speed : speed); 
    }
  }
  
  /**
   * Gets the speed for all speed controllers within the group.
   * Returns 0.0 if none exist.
   */
  public double get(){
    if(groupControllers.length>0)
      return groupControllers[0].get() * (isInverted? -1:1); 
    return 0.0;
  }
  
  /**
   * Sets the inverted state for the speed controller group.
   * @param isInverted Boolean parameter for the inverted status of the group.
   */
  public void setInverted(boolean isInverted){
    this.isInverted = isInverted;  
  }
  
  /**
   * Gets the inverted state for the speed controller group.
   */
  public boolean getInverted(){
    return this.isInverted;
  } 
}

class CANTalonSRX extends SpeedController{

  public CANTalonSRX(int deviceNumber){
    super(deviceNumber);
  }
  
}

class SpeedController{
  
  private double speed;
  private int deviceNumber;

  public SpeedController(int deviceNumber){
    this.speed = 0;
    this.deviceNumber = deviceNumber;
  }
  
  public void set(double speed){
    this.speed = speed;
  }
  
  public double get(){
    return this.speed; 
  } 
}

class XboxController{
  
  private String name;
  ControlIO control;
  ControlDevice device;
  ControlSlider leftStickX;
  ControlSlider leftStickY;
  ControlSlider rightStickX;
  ControlSlider rightStickY;
  
  public XboxController(String name, ControlIO control){
    this.name = name;
    this.control = control;
    this.device = control.getDevice(this.name);
    leftStickX = device.getSlider("X Axis");
    leftStickY = device.getSlider("Y Axis");
    rightStickX = device.getSlider("X Rotation");
    rightStickY = device.getSlider("Y Rotation");
    leftStickX.setTolerance(0.1);
    leftStickY.setTolerance(0.1);
    rightStickX.setTolerance(0.1);
    rightStickY.setTolerance(0.1);
  }
  
  public double getX(Hand hand){
    if(hand == Hand.kLeft){
      return leftStickX.getValue();
    }
    else if (hand == Hand.kRight){
      return rightStickX.getValue();
    }
    return 0.0;
  }
  
  public double getY(Hand hand){
    if(hand == Hand.kLeft){
      return leftStickY.getValue();
    }
    else if (hand == Hand.kRight){
      return rightStickY.getValue();
    }
    return 0.0;
  }

  
}

public enum Hand{
  kLeft, kRight; 
}
