import UIKit

class BankAccount {
    
    var balance: Double
    let lock = NSLock()
    
    init(balance: Double) {
        self.balance = balance
    }
    
    func withdraw(_ amount: Double) {
        lock.lock()
        defer {
            print("Defer Activated")
            lock.unlock() } // Lock 해제 보장

        if balance >= amount {
            let processingTime = UInt32.random(in: 0...3)
            print("[Withdraw] Processing for \(amount) \(processingTime) seconds")
            sleep(processingTime)
            print("Withdrawing \(amount) from account")
            balance -= amount
            print("Balance is \(balance)")
        }
    }
    
}

let bankAccount = BankAccount(balance: 500)
//bankAccount.withdraw(300)
//print(bankAccount.balance)


let queue = DispatchQueue(label: "ConcurrentQueue", attributes: .concurrent)

let otherQueue = DispatchQueue(label: "SerialQueue")

queue.async {
    bankAccount.withdraw(300)
}

queue.async {
    bankAccount.withdraw(100)
}

//otherQueue.async {
//    bankAccount.withdraw(300)
//}
//
//otherQueue.async {
//    bankAccount.withdraw(500)
//}
