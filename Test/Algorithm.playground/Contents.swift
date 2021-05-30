import Foundation

class Person {
    var name:String
    
    init(name:String) {
        self.name = name
    }
}

let person = Person(name: "foma")

let hello:((_ person:Person)->String) = { person in return "\(person.name) hello"}

func escaping(completion:@escaping(Person)->String) {
    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
        print("From Escaping Closure",completion(person))
    }
}

escaping(completion: hello)
person.name = "gran"
