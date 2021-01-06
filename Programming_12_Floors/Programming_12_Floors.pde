//Camera variables
float eyex, eyey, eyez, focusx, focusy, focusz, upx, upy, upz;

//Interaction
boolean wkey, akey, skey, dkey;

void setup() {
 size(800,800, P3D);
 
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
 
 focusx = eyex;
 focusy = eyey;
 focusz = eyez - 100;
 
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
