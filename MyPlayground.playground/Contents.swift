protocol Moveavbel{
    
    
    mutating func move()
    
}


class Car : Moveavbel{
    
    func move(){
        print ("Moved")
    }
    func move2(){
        
        print("Move 2")
    }
    
    
}


var c: Car =  Car()
c.move()
c.move2()











