public class Rectangle {
    //Method 1
    public void area(){
        Decimal length =10, bredth = 15;
        Decimal a = length*bredth;
        System.debug('Area is '+a);
    }
    
    
    //Method 2
    public void perimeter(){
        Decimal length =10, bredth = 15;
        Decimal p = 2*(length+bredth);
        System.debug('Perimeter is '+p);
    }

}