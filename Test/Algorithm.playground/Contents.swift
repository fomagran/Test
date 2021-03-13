import Foundation

struct User:Decodable,Encodable {
    let name:String
    let age:Int
    let gender:Bool
    
    init(name:String,age:Int,gender:Bool) {
        self.name = name
        self.age = age
        self.gender = gender
    }
}

extension Encodable {

    var dict : [String: Any]? {
        guard let data = try? JSONEncoder().encode(self) else { return nil }
        guard let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String:Any] else { return nil }
        return json
    }
}

let user1 = User(name: "foma", age: 26, gender: true)
let user2 = User(name: "gram", age: 26, gender: true)
let user3 = User(name: "asdf", age: 26, gender: true)
let dics = [user1.dict!,user2.dict!,user3.dict!]


func toObject<T:Decodable>(objectType:T.Type,dictionary:[[String:Any]]) -> [T]? {
    
    guard let json = try? JSONSerialization.data(withJSONObject: dictionary) else { return nil}
    let decoder = JSONDecoder()
    decoder.keyDecodingStrategy = .convertFromSnakeCase
    guard let decodedCountries = try? decoder.decode([T].self, from: json) else { return nil}
    
    return decodedCountries
}


print(toObject(objectType: User.self , dictionary: dics))

