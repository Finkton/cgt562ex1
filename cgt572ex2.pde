/*
https://processing.org/tutorials/p3d/
*/

float drawIter = 0;
boolean changeLightColors = false;

void setup() {
  size(600, 600, P3D); // p3d creates a scene in 3d
}

void draw() {
  //using draw as a loop
  drawIter ++;
  
  //set background to zero
  background(0); 
  
  // sets up camera and changes scene based on mouse position
  camera(mouseX, mouseY, (height/2) / tan(PI/6), //Eye position
          width/2, height/2, 0, //width/2, height/2, 0
          0, 1, 0); //width/2, height/2, 0
  
  // setup light
  if(changeLightColors)
    pointLight(abs(cos(drawIter/100.0))*255, abs(sin(drawIter/300.0))*255, abs(cos(drawIter/300.0))*255, //RGB
                mouseX, mouseY, (height/2) / tan(PI/6)); //light position, same as camera position
  else
    pointLight(255, 255, 255, //RGB
                mouseX, mouseY, (height/2) / tan(PI/6)); //light position, same as camera position
 
 
  int boxSize = 30; // the size of the box
  int boxNumber = 20; // the number of boxes in each direction
  
  // creating a for loop for boxes
  for(int z = 0; z< boxSize*boxNumber*2; z+= boxSize*2){
    for(int j = 0; j< boxSize*boxNumber*2; j+= boxSize*2){
      for(int i = 0; i< boxSize*boxNumber*2; i+= boxSize*2){
        box(boxSize);
        translate(boxSize*2, 0, 0);
      }
      translate(-boxSize*boxNumber*2, boxSize*2, 0);
    }
    translate( 0, -boxSize*boxNumber*2, boxSize*2);
  }
}

void mouseClicked(){
  changeLightColors = !changeLightColors;
}
