# Lesson_6_MotorControllers
 Lesson on Motor Controllers - Cloned from WPILib

## Setup

Clone this repository:

`git clone https://github.com/FRC-Processing-Lessons/Lesson_6_MotorControllers.git`

Navigate to your repository folder, and open the following file in Processing:

`Lesson_6_MotorControllers.pde`

In case you can't find processing, make sure that after unarchiving the application, setup shortcuts for the executable file.

There is a bit more setup involved.  For controller input to work, you will need install the following libraries in Processing:

`G4P - A set of 2D GUI controls and window utilities`

`Game Control Plus - A set of libraries for interfacing joysticks and controllers with Processing`

Both of the above were developed by Peter Lager, and his website can be found here: 

`http://www.lagers.org.uk/`

To download these libraries, in Processing, navigate to the "Tools --> Add Tool > Libraries".  Search for the tools above, and install them.

## Series Overview
This is the sixth of a series of lessons on programming in Java for the FIRST Robotics Competition.  It is designed for novice programmers, and can act as a precursor programming sequence to learning FRC-Java.  We will introduce:

0. Introduction to programming
1. Data abstraction
2. Procedure invocations  
3. Procedure definitions   
4. Conditions             
5. Field scope
6. Class definitions
7. Object instantiations     <--- We are here!
8. Instance methods
9. Static methods

This series will be taught using the Processing framework for easy visualization.

## Lesson Overview

Once the repository is cloned and the file is open in Processing, students should see 3 TODOs listed in the "Robot" tab. Throughout the course of this lesson, students will emulate development of an FRC Differential Drive robot using ported versions of the CAN Talon libraries and XBox Controller libraries.

### Tasks:

1.  Declare any objects that are needed for your robot to function.
2.  Initialize them in robotInit()
3.  Utilize them to make your robot move in teleopPeriodic()!  Please note that we're using Arcade Drive for our drive-scheme.

The following link will be super helpful to understanding what's going on.

`https://wpilib.screenstepslive.com/s/currentCS/m/java/l/914148-driving-a-robot-using-differential-drive`


4. Create a key event that changes the color of your Circle, but only when the key is held down.  Once the key is released, the Circle should go back to its original color!
