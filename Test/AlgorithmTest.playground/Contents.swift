import Foundation

func solution(_ N:Int, _ number:Int) -> Int {
    
    if number == N {
        return 1
    }
    
    let all = [[[1,1]],[[1,2]],[[1,3],[2,2]],[[1,4],[2,3]],[[1,5],[2,4],[3,3]],[[1,6],[2,5],[3,4]],[[1,7],[2,6],[3,5],[4,4]]]
    let operaters = ["+","-","*","/"]
    
    var results = Array(repeating: [Int](), count: 9)
    results[0].append(N)
    results[1].append(N)
    
    
    for (i,cases) in all.enumerated(){
        let a = Array(repeating: "\(N)", count: i+2).reduce(""){$0+$1}
        if  Int(a)! == number  {
            return i+2
        }
        results[i+2].append(Int(a)!)
        for c in cases {
            for a in results[c[0]] {
                for b in results[c[1]]  {
                    for op in operaters {
                        if op == "+" {
                            if (a + b) == number {
                                return i+2
                            }
                            results[i+2].append(a+b)
                        }else if op == "-"{
                            if (a - b) == number || (b - a) == number {
                                return i+2
                            }
                            results[i+2].append(a - b)
                            results[i+2].append(b - a)
                        }else if op == "*" {
                            if (a * b) == number {
                                return i+2
                            }
                            results[i+2].append(a * b)
                        }else if op == "/" {
                            if a == 0 || b  == 0 {
                                continue
                            }
                            if (a / b) == number || (b / a) == number {
                                return i + 2
                            }
                            results[i+2].append(a / b)
                            results[i+2].append(b / a)
                        }
                    }
                }
            }
        }
    }
    return -1
}

print(1,solution(5,12),4)
print(2,solution(2,11),3)
print(3,solution(5,5),1)
print(4,solution(5,10),2)
print(5,solution(5,31168),-1)
print(6,solution(1,1121),7)
print(7,solution(5,1010),7)
print(8,solution(3,4),3)
print(9,solution(5,5555),4)
print(10,solution(5,5550),5)
print(11,solution(5,20),3)
print(12,solution(5,30),3)
print(13,solution(6,65),4)
print(14,solution(5,2),3)
print(15,solution(5,4),3)
print(16,solution(1,1),1)
print(17,solution(1,11),2)
print(18,solution(1,111),3)
print(19,solution(1,1111),4)
print(20,solution(1,11111),5)
print(21,solution(7,7776),6)
print(22,solution(7,7784),5)
print(23,solution(2,22222),5)
print(24,solution(2,22223),7)
print(25,solution(2,22224),6)
print(26,solution(2,11111),6)
print(27,solution(2,11),3)
print(28,solution(2,111),4)
print(29,solution(2,1111),5)
print(30,solution(9,36),4)
print(31,solution(9,37),6)
print(32,solution(9,72),3)
print(33,solution(3,18),3)
print(34,solution(2,1),2)
print(35,solution(4,17),4)


35

24

21
