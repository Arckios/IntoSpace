public class AutoState implements State {
  int frame = 0;
   public void doAction(Context context,PeasyCam cam) {
      System.out.println("cam in auto mode ");
      context.setState(this);  
      frame++;
      if(frame < 60){
      cam.rotateY(radians(1));
      }else if(frame > 60 && frame < 120){
        cam.rotateX(radians(1));
      }else if(frame > 120 && frame < 180){
        cam.rotateZ(radians(1));
      }
      if(frame >= 180){
        frame = 0;
      }
   }

   public String toString(){
      return "Stop State";
   }
}