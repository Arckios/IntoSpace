class Particle {
    float radius;
    float distance;
    PVector position;
    PVector velocity;
    PVector acceleration;
    float lifespan;
    float angle;
    PVector v;
    float orbitspeed;

    Particle(PVector l) {
        this.v = PVector.random3D();
        this.acceleration = new PVector(0.0, 0.05);
        this.velocity = new PVector(random(-1.0, 1.0),random(-2.0, 0.0));
        this.radius = random(1, 3);
        this.distance = random(100,300);
        this.v.mult(this.distance);
        this.angle = random(6.2831855f);
        this.position = l.copy();
        this.position.x = random(width,width);
        this.position.y = random(height,height);
        this.position.z = random(width);
        this.orbitspeed = 0;
        this.lifespan = 50.0;
    }

    public void run() {
        this.update();
        this.display();
    }

    public void update() {
        velocity.add(acceleration);
        position.add(velocity);
        lifespan -= 1.0;
    }

    public void display() {
        pushMatrix();
        PVector v2 = new PVector(1.0, 0.0, 1.0);
        PVector p = v.cross(v2);
        rotate(angle, p.x, p.y, p.z);
        translate(v.x, v.y, v.z);
        stroke(255, 204, 0, lifespan);
        fill(255, 204, 0, lifespan);
        sphere(radius);
        popMatrix();
    }

    public boolean isDead() {
        if (lifespan < 0.0) {
            return true;
        }
        return false;
    }
}