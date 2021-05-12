import Foundation


func firstClassObject(_ a:Int,_ b:Int) -> Int {
    return a+b
}

let aPlusB = firstClassObject(1, 2)

func paramAPlusB(a:Int,b:Int,aPlusB:(Int,Int)->Int) {
   print(aPlusB(a,b))
}

paramAPlusB(a: 1, b: 2, aPlusB:firstClassObject(_:_:))

func returnAndParamAPlusB(a:Int,b:Int,aPlusB:(Int,Int)->Int) -> Int {
    
    return aPlusB(a,b)
}

returnAndParamAPlusB(a: 1, b: 2, aPlusB: firstClassObject(_:_:))
