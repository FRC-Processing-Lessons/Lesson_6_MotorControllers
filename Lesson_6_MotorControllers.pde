/*
FRC Java Lessons Using Processing
Lesson 6 - Robot Simulation
Copyright (c) 2019 Shichao Liang
See attached MIT license for usage rights.
In this lesson, students will learn how to simulate the FRC robot using CAN Talon SRXs,
an Xbox Controller, and a differential drive with arcade-style inputs.
*/ 

/*
  Preamble - For this lesson, all of the TODO tasks will be in the "Robot" tab.  All other
  tabs are code provided for you as part of the FRC WPI Library.
*/

/*
  For directions, please see the README: 
  https://github.com/FRC-Processing-Lessons/Lesson_5_Conditionals/blob/master/README.md
*/

/* ------------- ALL CODE GOES BELOW HERE --------------- */

import org.gamecontrolplus.*;

Robot myRobot;
ControlIO control;

void setup(){
  size(1000, 800);
  background(0,0,0);
  control = ControlIO.getInstance(this);
  myRobot = new Robot(control);
}

void draw(){
  background(0,0,0);
  myRobot.teleopPeriodic();
  myRobot.show();
}
