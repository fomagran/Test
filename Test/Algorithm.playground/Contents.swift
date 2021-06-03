import Foundation

let concurrentQueue = DispatchQueue(label:"ConcurrentQueue1",attributes: .concurrent)



func 작업1() {
    print("작업1 시작")
    Thread.sleep(forTimeInterval: 3)
    print("작업1 끝")
}

func 작업2() {
    print("작업2 시작")
    Thread.sleep(forTimeInterval: 2)
    print("작업2 끝")
}

func 작업3() {
    print("작업3 시작")
    Thread.sleep(forTimeInterval: 1)
    print("작업3 끝")
}

func 작업4() {
    print("작업4 시작")
    print("작업4 끝")
}

concurrentQueue.sync {
        작업1()
}

concurrentQueue.async {
        작업2()
}

concurrentQueue.sync {
        작업3()
}











//let serialQueue1 = DispatchQueue(label: "1")
//let serialQueue2 = DispatchQueue(label: "2")
//
//serialQueue1.sync  { print("Queue 1 start") }
//serialQueue2.sync  { print("Queue 2 start") }
//serialQueue1.sync { for i in 0...5 { print("Queue 1 : \(i)") }}
//serialQueue2.sync { for i in 0...5 { print("Queue 2 : \(i)") }}
//serialQueue1.sync  { for i in 6...10 { print("Queue 1: \(i)") } }
//serialQueue2.sync  { for i in 6...10 { print("Queue 2: \(i)") } }
//serialQueue1.sync  { print("Queue 1 end") }
//serialQueue2.sync  { print("Queue 2 end") }


//let concurrentQueue = DispatchQueue(label: "Foma",attributes: .concurrent)
//concurrentQueue.sync  { print("start") }
//concurrentQueue.sync { for i in 0...5 { print("\(i)") }}
//concurrentQueue.sync  { for i in 6...10 { print("\(i)") } }
//concurrentQueue.sync  { print("end") }

