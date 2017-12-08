class Meteor implements ShapeMeteor{
  float radius;
  float distance;
  Meteor[] meteors;
  float angle;
  float orbitspeed;
  PVector v;
  PShape meteor;
  
  Meteor(float r, float d, float o,PImage img) {
    v = PVector.random3D();
    radius = r;
    distance = d;
    v.mult(distance);
    angle = random(TWO_PI);
    orbitspeed = o;
    noStroke();
    noFill();
    meteor = createShape(SPHERE, radius);
    meteor.setTexture(img);
  }
  
  @Override
  void orbit() {
    angle = angle + orbitspeed;
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
    shape(meteor);
    //ellipse(0, 0, radius*2, radius*2);
    if (meteors != null) {
      for (int i = 0; i < meteors.length; i++) {
        meteors[i].show();
      }
    }
    popMatrix();
  }
}