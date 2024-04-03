public class Square {
    
    Decimal side=0;
    
    public Square(Decimal s){
         side=s;
    }
    public  void perimeter(){
        
        Decimal p= 4*side;
        System.debug('Perimeter of square is : '+p);
    }
    
    public  void area(){
        Decimal a= side*side;
         
        System.debug('Area of square is : '+a);
    }

}