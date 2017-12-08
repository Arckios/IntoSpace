import peasy.*;
PeasyCam cam;
ShapePlanet sun;
ShapeMeteor[] meteor = new ShapeMeteor[20];
PImage sunTexture,
       MeteorTexture;
PImage[] textures = new PImage[9];
MeteorFactory meteorfactory;
ParticleSystem ps;
Context context;
AutoState autoState;
ManualState manualState;
boolean key1,
        key2;

void setup() {
  fullScreen(P3D);
  context = new Context();
  autoState = new AutoState();
  manualState = new ManualState();
  sunTexture = loadImage("sun.jpg");
  textures[0] = loadImage("mercury.jpg");
  textures[1] = loadImage("venus.jpg");
  textures[2] = loadImage("earth.jpg");
  textures[3] = loadImage("mars.jpg");
  textures[4] = loadImage("jupiter.jpg");
  textures[5] = loadImage("saturn.jpg");
  textures[6] = loadImage("uranus.jpg");
  textures[7] = loadImage("neptune.jpg");
  textures[8] = loadImage("pluto.jpg");
  MeteorTexture = loadImage("phobos.jpg");
  cam = new PeasyCam(this,500);
  sun = new Planet(50, 0, 0,sunTexture);
  ps = new ParticleSystem(new PVector(width, 50));
  meteorfactory = new MeteorFactory();
        cam.rotateY(radians(90));
      cam.rotateZ(radians(-90));
    for (int i = 0; i < meteor.length; i++) {
    meteor[i] = meteorfactory.getShape("METEOR",random(2,5),300,random(0,0.02),MeteorTexture);
  }
}

void draw() {
  background(0);
  ambientLight(255,255,255);
  int z = 75;
  pointLight(255, 255, 255, -50, -50, z);
  pointLight(255, 255, 255, 50, -50, z);
  pointLight(255, 255, 255, 50, 50, z);
  pointLight(255, 255, 255, -50, 50, z);
  sun.play();
  ps.addParticle();
  ps.run();
  for (int i = 0; i < meteor.length; i++) {
     meteor[i].show();
     meteor[i].orbit();
  }
  if(key1){
    autoState.doAction(context,cam);
  }else if(key2){
    manualState.doAction(context,cam);
  }
}

void keyPressed(){
  if(key == '1'){
    key1 = true;
    key2 = false;
  }
  if(key == '2'){
    key1 = false;
    key2 = true;
  }
}