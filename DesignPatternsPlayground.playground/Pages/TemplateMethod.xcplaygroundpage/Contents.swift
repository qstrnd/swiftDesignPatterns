//: [Previous](@previous)

import Foundation

public class Worker {

    open func prepareForWork() {}
    open func performWork() {}
    open func cleanUpAfterWork() {}

    public func work() {
        prepareForWork()
        performWork()
        cleanUpAfterWork()
    }
}

final class Cook: Worker {
    override func performWork() {
        print("Do cooking")
    }
}

let john = Cook()
john.work()

//: [Next](@next)
