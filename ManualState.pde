public class ManualState implements State {
  
   public void doAction(Context context,PeasyCam cam) {
      System.out.println("cam in manual mode");
      context.setState(this);  
   }

   public String toString(){
      return "Stop State";
   }
}