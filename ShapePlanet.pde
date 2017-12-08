public abstract class ShapePlanet {
  abstract void show();
  abstract void orbit();
  public final void play(){
    show();
    orbit();
  }
}