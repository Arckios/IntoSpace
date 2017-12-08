public class MeteorFactory {
  public ShapeMeteor getShape(String shapeType,float r, float d, float o,PImage img){
    if(shapeType == null){
      return null;
    }else if(shapeType.equalsIgnoreCase("METEOR")){
      return new Meteor(r,d,o,img);
    }
    return null;
  }
}