import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class AsteroidsGame extends PApplet {

boolean UpIsPressed = false;
boolean LeftIsPressed = false;
boolean RightIsPressed = false;
boolean ShiftIsPressed = false;

NormalParticle[] Stars;

SpaceShip Normandy = new SpaceShip();
public void setup() 
{
	size(1200, 900);
	Stars = new NormalParticle[1000];
	for (int i = 0; i < Stars.length; i++) 
	{
		Stars[i] = new NormalParticle();
	}
}
public void draw() 
{
	background(0);
	for (int i = 0; i < Stars.length; i++) 
	{
		Stars[i].move();
		Stars[i].show();
	}
	Normandy.move();
	Normandy.show();
	if(UpIsPressed == true) //Up
	{
		Normandy.accelerate(0.1f);
	}
	if(LeftIsPressed == true) //Left
	{
		Normandy.rotate(-5);
	}
	if(RightIsPressed == true) //Right
	{
		Normandy.rotate(5);
	}
}
public void keyPressed()
{
	if(keyCode == UP) //Up
	{
		UpIsPressed = true;
	}
	if(keyCode == LEFT) //Left
	{
		LeftIsPressed = true;
	}
	if(keyCode == RIGHT) //Right
	{
		RightIsPressed = true;
	}
	if(keyCode == SHIFT) //Shift
	{
		Normandy.setDirectionX(0);
		Normandy.setDirectionY(0);
		Normandy.setX((int)(Math.random()*width));
		Normandy.setY((int)(Math.random()*height));
		Normandy.setPointDirection((int)(Math.random()*360));
	}
}
public void keyReleased()
{
	if(keyCode == UP) //Up
	{
		UpIsPressed = false;
	}
	if(keyCode == LEFT) //Left
	{
		LeftIsPressed = false;
	}
	if(keyCode == RIGHT) //Right
	{
		RightIsPressed = false;
	}
	if(keyCode == SHIFT) //Shift
	{
		ShiftIsPressed = false;
	}
}
class NormalParticle
{
	double pX, pY, pSize, pSpeed, pTheta;
	int pR, pG, pB;
	NormalParticle()
	{
		pX = width/2;
		pY = height/2;
		pSize = Math.random()*6+1;
		pSpeed = Math.random()*5;
		pTheta = Math.random()*360+1;
		pR = (int)(Math.random()*255+1);
		pG = (int)(Math.random()*255+1);
		pB = (int)(Math.random()*255+1);
	}
	public void move()
	{
		pX += Math.cos(pTheta) * pSpeed;
		pY += Math.sin(pTheta) * pSpeed;
	}
	public void show()
	{
		noStroke();
		fill(pR, pB, pG, 175);
		ellipse((float)pX, (float)pY, (float)pSize, (float)pSize);
	}
}
class SpaceShip extends Floater  
{   
	SpaceShip()
	{
		corners = 5;
		xCorners = new int[corners];
			xCorners[0] = 14;
			xCorners[1] = -20;
			xCorners[2] = -12;
			xCorners[3] = -12;
			xCorners[4] = -20;
		yCorners = new int[corners];
			yCorners[0] = 0;
			yCorners[1] = -14;
			yCorners[2] = -6;
			yCorners[3] = 6;
			yCorners[4] = 14;
		myColorF = 255;
		myColorS = 255;
		myCenterX = 600;
		myCenterY = 450;
		myDirectionX = 0;
		myDirectionY = 0;
		myPointDirection = -90;
	}

	public void setX(int x){myCenterX = x;}
	public int getX(){return (int)myCenterX;}
	public void setY(int y){myCenterY = y;}
	public int getY(){return (int)myCenterY;}

	public void setDirectionX(double x){myDirectionX = x;}
	public double getDirectionX(){return (int)myDirectionX;}
	public void setDirectionY(double y){myDirectionY = y;}
	public double getDirectionY(){return (int)myDirectionY;}

	public void setPointDirection(int degrees){myPointDirection = degrees;}
	public double getPointDirection(){return (int)myPointDirection;}
}
abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
{
	protected int corners;  //the number of corners, a triangular floater has 3   
	protected int[] xCorners;   
	protected int[] yCorners;   
	protected int myColorF, myColorS;   
	protected double myCenterX, myCenterY; //holds center coordinates   
	protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
	protected double myPointDirection; //holds current direction the ship is pointing in degrees    
	abstract public void setX(int x);  
	abstract public int getX();   
	abstract public void setY(int y);   
	abstract public int getY();   
	abstract public void setDirectionX(double x);   
	abstract public double getDirectionX();   
	abstract public void setDirectionY(double y);   
	abstract public double getDirectionY();   
	abstract public void setPointDirection(int degrees);   
	abstract public double getPointDirection(); 

	//Accelerates the floater in the direction it is pointing (myPointDirection)   
	public void accelerate (double dAmount)   
	{          
		//convert the current direction the floater is pointing to radians    
		double dRadians = myPointDirection*(Math.PI/180);     
		//change coordinates of direction of travel    
		myDirectionX += ((dAmount) * Math.cos(dRadians));    
		myDirectionY += ((dAmount) * Math.sin(dRadians));       
	}   
	public void rotate (int nDegreesOfRotation)   
	{     
		//rotates the floater by a given number of degrees    
		myPointDirection += nDegreesOfRotation;   
	}   
	public void move ()   //move the floater in the current direction of travel
	{      
		//change the x and y coordinates by myDirectionX and myDirectionY       
		myCenterX += myDirectionX;    
		myCenterY += myDirectionY;     

		//wrap around screen    
		if(myCenterX > width)
		{     
			myCenterX = 0;    
		}    
		else if (myCenterX < 0)
		{     
			myCenterX = width;    
		}    
		if(myCenterY > height)
		{    
			myCenterY = 0;    
		}   
		else if (myCenterY < 0)
		{     
			myCenterY = height;    
		}   
	}   
	public void show ()  //Draws the floater at the current position  
	{             
		fill(myColorF);
		stroke(myColorS); 
		//convert degrees to radians for sin and cos         
		double dRadians = myPointDirection*(Math.PI/180);                 
		int xRotatedTranslated, yRotatedTranslated;    
		beginShape();         
		for(int nI = 0; nI < corners; nI++)    
		{     
		  //rotate and translate the coordinates of the floater using current direction 
		  xRotatedTranslated = (int)((xCorners[nI] * Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
		  yRotatedTranslated = (int)((xCorners[nI] * Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
		  vertex(xRotatedTranslated,yRotatedTranslated);    
		}   
		endShape(CLOSE);  
	}
}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "AsteroidsGame" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
