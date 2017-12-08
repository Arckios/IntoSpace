public class AutoState implements State {
  
   public void doAction(Context context,PeasyCam cam) {
      System.out.println("cam in auto mode ");
      context.setState(this);  
      cam.rotateY(radians(1));
   }

   public String toString(){
      return "Stop State";
   }
}