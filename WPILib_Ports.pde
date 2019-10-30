/*----------------------------------------------------------------------------*/
/* Copyright (c) 2016-2019 FIRST. All Rights Reserved.                        */
/* Open Source Software - may be modified and shared by FRC teams. The code   */
/* must be accompanied by the FIRST BSD license file in the root directory of */
/* the project.                                                               */
/*----------------------------------------------------------------------------*/
/* Modified for Processing by Michael Liang for FRC Team 1648                 */
/*----------------------------------------------------------------------------*/

import org.gamecontrolplus.*;

class SpeedControllerGroup implements SpeedController{

  private final SpeedController[] groupControllers;
  private boolean isInverted;
  private boolean enabled;
  
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
    this.enabled = true;
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
    if(groupControllers.length>0 && enabled)
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
  
  /**
   * Disables the speed controller.  Cannot be undone without restarting the robot.
   */
  public void disable(){
    this.enabled = false;
  }
  
  /**
   * Stops motor movement.  Motor can be moved again by calling set wihtout having to re-enable the motor.
   */
  public void stopMotor(){
    this.set(0); 
  }
}

class CANTalonSRX implements SpeedController{
  
  private double speed;
  private int deviceNumber;
  private boolean isInverted;
  private boolean enabled;

  public CANTalonSRX(int deviceNumber){
    this.speed = 0;
    this.deviceNumber = deviceNumber;
    this.enabled = true;
  }
  
  public void set(double speed){
    this.speed = speed;
  }
  
  public double get(){
    return this.speed; 
  } 
  
  public void setInverted(boolean isInverted){
    this.isInverted = isInverted; 
  }
  
  public boolean getInverted(){
    return this.isInverted;
  }
  
  public void disable(){
    this.enabled = false;
  }
  
  public void stopMotor(){
    this.speed = 0; 
  }
}


interface SpeedController{
 
  void set(double speed);
  double get();
  void setInverted(boolean isInverted);
  boolean getInverted();
  void disable();
  void stopMotor();
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

public class DifferentialDrive{
  
  private SpeedController leftMotor;
  private SpeedController rightMotor;
  public double xSlider;
  public double ySlider;
  
  public DifferentialDrive(SpeedController leftMotor, SpeedController rightMotor){
    this.leftMotor = leftMotor;
    this.rightMotor = rightMotor;
  }
  
  public void arcadeDrive(double xSpeed, double zRotation, boolean squareInputs){
    this.xSlider = xSpeed;
    this.ySlider = zRotation;
    xSpeed = MathUtils.clamp(xSpeed, -1.0, 1.0);
    zRotation = MathUtils.clamp(zRotation, -1.0, 1.0);
    if (squareInputs) {
      xSpeed = Math.copySign(xSpeed * xSpeed, xSpeed);
      zRotation = Math.copySign(zRotation * zRotation, zRotation);
    }
    double leftMotorOutput;
    double rightMotorOutput;

    double maxInput = Math.copySign(Math.max(Math.abs(xSpeed), Math.abs(zRotation)), xSpeed);

    if (xSpeed >= 0.0) {
      // First quadrant, else second quadrant
      if (zRotation >= 0.0) {
        leftMotorOutput = maxInput;
        rightMotorOutput = xSpeed - zRotation;
      } else {
        leftMotorOutput = xSpeed + zRotation;
        rightMotorOutput = maxInput;
      }
    } else {
      // Third quadrant, else fourth quadrant
      if (zRotation >= 0.0) {
        leftMotorOutput = xSpeed + zRotation;
        rightMotorOutput = maxInput;
      } else {
        leftMotorOutput = maxInput;
        rightMotorOutput = xSpeed - zRotation;
      }
    }

    leftMotor.set(MathUtils.clamp(leftMotorOutput, -1.0, 1.0) * 1);
    rightMotor.set(MathUtils.clamp(rightMotorOutput, -1.0, 1.0) * 1);
  }
}

public static final class MathUtils{
  private MathUtils() {
    throw new AssertionError("utility class");
  }
  /**
   * Returns value clamped between low and high boundaries.
   *
   * @param value Value to clamp.
   * @param low   The lower boundary to which to clamp value.
   * @param high  The higher boundary to which to clamp value.
   */
  public static double clamp(double value, double low, double high) {
    return Math.max(low, Math.min(value, high));
  }
}

public enum Hand{
  kLeft, kRight; 
}
