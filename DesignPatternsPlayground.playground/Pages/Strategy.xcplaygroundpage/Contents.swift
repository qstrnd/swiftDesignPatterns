//: [Previous](@previous)

import Foundation

protocol TestableSubject {
    var name: String { get }
    var age: Int { get }
}

protocol TestingStrategy {
    func test(_ subject: TestableSubject) -> Bool
}

final class AproveDimonStrategy: TestingStrategy {
    func test(_ subject: TestableSubject) -> Bool {
        subject.name == "Dimon" || subject.name == "Димон"
    }
}

final class AproveOldStrategy: TestingStrategy {
    func test(_ subject: TestableSubject) -> Bool {
        subject.age > 30
    }
}

struct Person: TestableSubject {
    let name: String
    let age: Int
}

final class BenefitsDispatcher {
    var benefitStrategy: TestingStrategy

    init(benefitStrategy: TestingStrategy) {
        self.benefitStrategy = benefitStrategy
    }

    func dispatchBenefits(_ subject: TestableSubject) {
        guard benefitStrategy.test(subject) else {
            print("No benefits sorry, \(subject.name)"); return
        }
        print("Here are some benefits for \(subject.name)")
    }
}

// Usage

let dimonStrategy = AproveDimonStrategy()
let aproveOldStrategy = AproveOldStrategy()
let dispatcher = BenefitsDispatcher(benefitStrategy: dimonStrategy)

let mark = Person(name: "Mark", age: 50)
let dimon = Person(name: "Dimon", age: 19)

print("Dimon strategy")
dispatcher.dispatchBenefits(mark)
dispatcher.dispatchBenefits(dimon)

print("Old strategy")
dispatcher.benefitStrategy = aproveOldStrategy
dispatcher.dispatchBenefits(mark)
dispatcher.dispatchBenefits(dimon)

//: [Next](@next)
