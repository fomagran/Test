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

