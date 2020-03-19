import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

float r;
float g;
float bl;
float w;
float h;


ArrayList <Huella> huellas;


Suelo limite;
Suelo2 limiteDos;
Box2DProcessing mundo;

void setup(){
 
  w=0;
  h=0;
 background(255);
 size(600,600);
 mundo = new Box2DProcessing(this);
 mundo.createWorld();
 huellas = new ArrayList <Huella>();
 limite = new Suelo(125,500,250,30);
 limiteDos = new Suelo2 (475,400,250,30);
 
 

}

void mousePressed (){
  w=1;
  h=1;
   r = random(0,255);
 g = random(0,255);
 bl = random(0,255);

}

void mouseReleased(){
  huellas.add(new Huella (mouseX, mouseY, w,h));
}

void draw(){

mundo.step();
for(Huella h:huellas){
h.display();
}
limite.display();
limiteDos.display();
   
 if (mousePressed) {
  noStroke();
  fill(r,g,bl);
  rect(mouseX,mouseY,w,h); 
  
  w++; 
  h++;
}

 textSize(30);
    fill(0);
    text("Prreciona el mouse para dejar tu huella",10,40);
}
