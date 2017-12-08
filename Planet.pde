boolean spawned = false;

class Planet extends ShapePlanet{
  float radius;
  float distance;
  Planet[] planets;
  float angle;
  float orbitspeed; //<>//
  PVector v;
  PShape globe;

  Planet(float r, float d, float o,PImage img) {

    v = PVector.random3D();

    radius = r;
    distance = d;
    v.mult(distance);
    angle = random(TWO_PI);
    orbitspeed = o;
    noStroke();
    noFill();
    globe = createShape(SPHERE, radius);
    globe.setTexture(img);
    if(!spawned){
    spawnMoons(9,2); //<>//
    }
  }
  
  @Override
  void orbit() {
    angle = angle + orbitspeed;
    if (planets != null) {
      for (int i = 0; i < planets.length; i++) {
        planets[i].orbit();
      }
    }
  }
  
  void spawnMoons(int total, int level) {
    spawned = true; //<>//
    planets = new Planet[total];
    for (int i = 0; i < planets.length; i++) {
      float r = radius/(level*2);
      float d = random((radius + r), (radius+r)*4);
      float o = random(0, 0.02);
      planets[i] = new Planet(r, d, o,textures[i]);
      if (level < 2) {
        int num = int(random(0, 3));
        planets[i].spawnMoons(num, level+1);
      }
    }
  }
  
  @Override
  void show() {
    pushMatrix();
    noStroke();
    PVector v2 = new PVector(1, 0, 1);
    PVector p = v.cross(v2);
    rotate(angle, p.x, p.y, p.z);
    stroke(255);
    translate(v.x, v.y, v.z);
    noStroke();
    fill(255);
    shape(globe);
    if (planets != null) {
      for (int i = 0; i < planets.length; i++) {
        planets[i].show();
      }
    }
    popMatrix();
  }
}