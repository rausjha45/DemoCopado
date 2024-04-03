public class RectangleWithConstructor {

    Decimal length, bredth;
    
    public RectangleWithConstructor(){
        length =10; 
        bredth = 15;
    }
    //Method 1
    public void area(){
        Decimal a = length*bredth;
        System.debug('Area is '+a);
    }
    
    
    //Method 2
    public void perimeter(){
        Decimal p = 2*(length+bredth);
        System.debug('Perimeter is '+p);
    }
}