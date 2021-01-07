import java.awt.Robot;

Robot rbt;

//Camera variables
float eyex, eyey, eyez, focusx, focusy, focusz, upx, upy, upz;

//Interaction
boolean wkey, akey, skey, dkey;

//Rotation variables
float leftRightAngle;
float upDownAngle; 

void setup() {
  noCursor();
  try {
    rbt = new Robot();
    
  }
  catch(Exception e) {
   e.printStackTrace(); 
  }
  
  leftRightAngle = 0;
  upDownAngle = 0;
  
 size(displayWidth,displayHeight,P3D);
 
 eyex = height/2;
 eyey = height/2;
 eyez = height/2; 
 
 focusx = eyex;
 focusy = eyey;
 focusz = eyez - 100;
 
 upx = 0;
 upy = 1;
 upz = 0;
}

void draw() { 
 background(0);
 
//line(x1, y1, z1, x2, y2, z2);

camera(eyex, eyey, eyez, focusx, focusy, focusz, upx, upy, upz);
move();
drawAxis();
drawFloor(-2000, 2000, height, 100); 
drawFloor(-2000, 2000, 0, 100);
drawInterface();
}

void drawInterface() { 
  pushMatrix();
 stroke(200,0,0);
 strokeWeight(5);
 line(width/2-10, height/2, width/2+10, height/2);
 line(width/2, height/2-10, width/2, height/2+10);
 popMatrix();
}

void move() { 
  pushMatrix();
  translate(focusx,focusy,focusz);
  sphere(5);
  popMatrix();
  
  
 if(akey) eyex -= 10;
 if(dkey) eyex += 10;
 if(wkey) eyez -= 10;
 if(skey) eyez += 10;
 
 focusx = eyex + cos(leftRightAngle)*300;
 focusy = eyey + tan(upDownAngle)*300;
 focusz = eyez + sin(leftRightAngle)*300;
 
 leftRightAngle += (mouseX - pmouseX)*0.01;
 upDownAngle += (mouseY-pmouseY)*0.01;
 
 if (upDownAngle > PI/2.5) upDownAngle = PI/2.5;
  if (upDownAngle < -PI/2.5) upDownAngle = -PI/2.5;
  
 if (mouseX > width-2) rbt.mouseMove (3, mouseY);
 if (mouseX < 2) rbt.mouseMove(width-3, mouseY); //3 so it doesn't trigger the other if statement 
 
 //leftRightAngle += 0.01;
 //upDownAngle += 0.01
}

void drawAxis() {
  stroke(200,0,0);
  strokeWeight(3);
 line(0,0,0,1000,0,0); //x axis
 line(0,0,0,0,1000,0); //y axis
 line(0,0,0,0,0,1000); //z axis
  
}

void drawFloor(int start, int end, int floorHeight, int floorSpacing) { 
  stroke(255);
  //line(width/2, height, -1000, width/2, height, 1000);
  
  int x = start;
  int z = start;
  while (x < end) {
    line(x, floorHeight, start, x, floorHeight, end);
    line(start, floorHeight, z, end, floorHeight, z);
     x += floorSpacing;
     z += floorSpacing;
  }
  
//for (int x = -2000; x < 2000; x += 100) {
 
}
