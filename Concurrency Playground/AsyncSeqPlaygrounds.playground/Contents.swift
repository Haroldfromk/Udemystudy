import UIKit


extension URL {
    func allLines() async -> Lines {
        Lines(url: self)
    }
}

struct Lines: Sequence {
    
    let url: URL
    
    func makeIterator() -> some IteratorProtocol {
        let lines = (try? String(contentsOf: url))?.split(separator: "\n") ?? []
        return LinesIterator(lines: lines)
    }
    
}

struct LinesIterator: IteratorProtocol {
    
    typealias Element = String
    var lines: [String.SubSequence]
    
    mutating func next() -> Element? {
        if lines.isEmpty {
            return nil
        }
        return String(lines.removeFirst())
    }
}

let endpointURL = URL(string: "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_month.csv")!

Task {
    for try await line in endpointURL.lines {
        print(line)
    }

}


//Task {
//    for line in await endpointURL.allLines() {
//        print(line)
//    }
//}


//struct Countdown: Sequence, IteratorProtocol {
//    var count: Int
//
//    mutating func next() -> Int? {
//        if count == 0 {
//            print("Due to Returning nil, function will be closed")
//            return nil
//        } else {
//            defer {
//                count -= 1
//                print("Defer excuted, count to \(count)")
//            }
//            print("Returning \(count)")
//            return count
//        }
//    }
//}


//let threeToGo = Countdown(count: 3)
//for i in threeToGo {
//    print(i)
//}


//struct CountdownTest {
//    var count: Int
//
//    func next() -> [Int] {
//        var result: [Int] = []
//        for i in (1...count).reversed() {
//            result.append(i)
//        }
//        return result
//    }
//}
//
//var countdown = CountdownTest(count: 3)
//for i in countdown.next() {
//    print(i)
//}

//let animals = ["Antelope", "Butterfly", "Camel", "Dolphin"]

//var animalIterator = animals.makeIterator()
//while let animal = animalIterator.next() {
//    print(animal)
//}

//struct DoublingIterator {
//    var value: Int
//    var limit: Int? = nil
//
//    mutating func next() -> Int? {
//        if let count = limit, value > count {
//            return nil
//        } else {
//            let current = value
//            value *= 2
//            return current
//        }
//    }
//}
//
//var iterator = DoublingIterator(value: 1, limit: 1024)
//for value in AnyIterator({ iterator.next() }) {
//    print(value)
//}

//var linesSample = ["Line 1", "Line 2", "Line 3"]
//
//print(linesSample.dropFirst())
//print(linesSample)
