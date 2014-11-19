boolean UpIsPressed = false;
boolean LeftIsPressed = false;
boolean RightIsPressed = false;
boolean ShiftIsPressed = false;

Star[] sField;
Asteroid[] aField;
SpaceShip Normandy = new SpaceShip();
public void setup() 
{
	size(1200, 900);
	sField = new Star[400];
	for (int i = 0; i < sField.length; ++i) {
		sField[i] = new Star();
	}
	aField = new Asteroid[10];
	for (int i = 0; i < aField.length; i++) {
		aField[i] = new Asteroid();
		aField[i].setDirectionX(Math.random()*20-10);
		aField[i].setDirectionY(Math.random()*20-10);
	}
}
public void draw() 
{
	background(0);

	for (int i = 0; i < sField.length; ++i) {
		sField[i].show();
	}

	for (int i = 0; i < aField.length; i++) {
		aField[i].move();
		aField[i].show();
		aField[i].rotate((int)(Math.random()*8));
	}
	Normandy.move();
	Normandy.show();
	if(UpIsPressed == true) //Up
	{
		Normandy.accelerate(0.1);
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
class Asteroid extends Floater
{
	public int aSize;
	Asteroid()
	{
		aSize = 8;
		corners = 7;
		xCorners = new int[corners];
			xCorners[0] = -(13+aSize);
			xCorners[1] = (2+aSize);
			xCorners[2] = (9+aSize);
			xCorners[3] = (13+aSize);
			xCorners[4] = (7+aSize);
			xCorners[5] = -(10+aSize);
			xCorners[6] = -(19+aSize);
		yCorners = new int[corners];
			yCorners[0] = -(12+aSize);
			yCorners[1] = -(17+aSize);
			yCorners[2] = -(12+aSize);
			yCorners[3] = (0+aSize);
			yCorners[4] = (12+aSize);
			yCorners[5] = (15+aSize);
			yCorners[6] = (0+aSize);
		myColorF = 255;
		myColorS = 255;
		myCenterX = Math.random()*width;
		myCenterY = Math.random()*height;
		myDirectionX = 0;
		myDirectionY = 0;
		myPointDirection = Math.random()*360;
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
class Star 
{
	double starX, starY, starSize;
	int starColor;
	Star()
	{
		starX = Math.random()*width;
		starY = Math.random()*height;
		starSize = Math.random()*10;
		starColor = (int)(Math.random()*255+1);
	}
	private void show()
	{
		fill(starColor,starColor,starColor);
		ellipse((float)starX, (float)starY, (float)starSize, (float)starSize);
	}
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