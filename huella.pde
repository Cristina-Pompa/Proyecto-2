  class Huella{
  
  float t;
  float r_=r;
  float g_=g;
  float b_=bl;
  Body b;
  
  
  Huella(float x_, float y_, float w_, float h_){
    t=100;
    
    w=w_;
    h=h_;
    
    BodyDef bd= new BodyDef();
    Vec2 poscicionInicial = new Vec2(x_,y_);
    Vec2 posicionEnBox2d = mundo.coordPixelsToWorld(poscicionInicial);
    bd.position.set(posicionEnBox2d);
    
    bd.type = BodyType.DYNAMIC;
    
    b = mundo.createBody(bd);
    b.setLinearVelocity (new Vec2(random(-5,5), random(10)));
    b.setAngularVelocity(random(-3,3));
    
    
    PolygonShape ps = new PolygonShape();
    float ancho = mundo.scalarPixelsToWorld(w_);
    float alto = mundo.scalarPixelsToWorld(h_);
    ps.setAsBox(ancho/2,alto/2);
    
    
    FixtureDef fd = new FixtureDef();
    fd.shape = ps;
    fd.friction = 0.3;
    fd.restitution = 1;
    fd.density = .4;
    
    b.createFixture(fd); 
    
  }

void display(){
  
 
  Vec2 posicion = mundo.getBodyPixelCoord(b);
  float angulo = b.getAngle();
  pushMatrix();
  translate(posicion.x,posicion.y);
  rotate(- angulo);
  rectMode(CENTER);
  noStroke();
  fill(r_,g_,b_,t);
  rect(0,0,w,h);
  popMatrix();
  t-=.25;
  
  if(t<=0){
  b.setActive(false);
  }
   if(t<=0){
   }
  

}
}
