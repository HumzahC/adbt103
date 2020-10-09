import processing.sound.*;
Drop [] drops = new Drop[300];

SoundFile Bird, trees, rain;

float t =0; //constant counter
float m =0; //moon counter
float s =0; //sun counter

float w =0; //width counter
float h =0; //height counter

float f=0; //flying counter
PImage tree, bird;

PImage bird1, bird2;

int x =0;
int fpc = 15; //frames per change



void setup()
{
  size (1000,500);
  
  for (int i = 0; i < drops.length; i++) {
    drops[i] = new Drop();
  }
  bird = loadImage("bird.png");
  tree = loadImage("tree.png");
  w =random(10);
  h = random(200,210);

bird1 = loadImage("bird1.png");
bird2 = loadImage("bird2.png");

Bird = new SoundFile(this,"bird.wav");
rain = new SoundFile(this,"rain.wav");
trees = new SoundFile(this,"trees.wav");

}
    void draw()
{
      

  
  background(27-t/4,   108-t/4,    117-t/4);   // Sky
  
  fill(16-t/4,  105-t/4,   40-t/4);  // Ground.
  noStroke();
  rect(0, height*2/3, width, height*2/3);
  

  fill(255-t*0.31,   242-t*0.3,   126-t*0.3);// Sun movement
  noStroke();
  ellipse(-100+s,60,100,100);
  
  fill(255,   255,   255);// moon movement
  noStroke();
  ellipse(-1100+m,60,100,100);
  
  
  
  image(tree,w+1000,h,150,150); //top row of trees
  image(tree,w+800,h,150,150);
  image(tree,w+600,h,150,150);
  image(tree,w+400,h,150,150);
  image(tree,w+200,h,150,150);
  image(tree,w,h,150,150);
  
  image(tree,w+900,h+120,150,150);//bottem row of trees
  image(tree,w+700,h+120,150,150);

  image(tree,w+100,h+120,150,150);
  image(tree,w-100,h+120,150,150);
  
  trees.play(); // tree sound plays
  
  tint(255-t); //darkens the trees
  

  t=t-0.7;
  s=s+1;
  m=m+1;
  f=f+8;
  x = frameCount;
  
  int changes = frameCount/fpc;
  int ischangesodd = changes%2;
  
  if (ischangesodd == 0){ //bird looks like its flapping
    image(bird1,x*10,0,80+t,80+t); 
    
  }else{
    image(bird2,x*10,60+t,80+t,80+t);
 
  }
  
  if (s <= 5){
    Bird.play(); //bird sound plays
  } else {
 Bird.pause(); //bird sound plays
  }
  
  /*
   if (f >=0){
  image(bird,-300+f,50,400-f*0.12,92-f*0.05);}//birds flying
  else if (f >= 1400){
    image(bird,-300,50,4,92);//stop flying
  }
  
*/

  
  
if (s >= width/2){ //once the sun passes half of the screen, the scene becomes darker//
  
  t= t+3;
  
    for (int i = 0; i < drops.length; i++) { //begins to rain
  drops[i].fall();
  drops[i].show();
  rain.play();  // rain sound plays
}



}

if (m >= width+60){ //once the moon counter passes 1060, the scene becomes lighter//
  t= t-3.15;
  /*
    fill(8-t/2.5,  88-t/2.5,    172-t/2.5);  // pond
  noStroke();
  ellipse(width/2, height*6/7, 300, 100); */

}
if (m >= 2*width+150){ //once the moon counter passes 2150, the scene resets//
  
  s=1;
  m=1;
  f=1;

  
}/*
  if (m >= width+150){ //once the moon counter passes 1150, the scene resets//
  background(27-t/4,     108-t/4,    117-t/4);   // Sky
  
  fill(8-t/4,  88-t/4,    172-t/4);  // Ground.
  noStroke();
  rect(0, height*2/3, width, height*2/3);
  
  
   fill(255,   255,   255);// moon movement
  noStroke();
  ellipse(-1100+m,60,100,100);
  
  }*/
}
