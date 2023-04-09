//: [Previous](@previous)

import Foundation

class Planet: VisitedPlanet {
    var name: String = ""

    func isVisited(by planetVisitor: PlanetVisitor) {}
}

final class Mercury: Planet {
    override func isVisited(by planetVisitor: PlanetVisitor) {
        planetVisitor.visit(mercury: self)
    }
}

final class Earth: Planet {
    override func isVisited(by planetVisitor: PlanetVisitor) {
        planetVisitor.visit(earth: self)
    }
}

final class Saturn: Planet {
    override func isVisited(by planetVisitor: PlanetVisitor) {
        planetVisitor.visit(saturn: self)
    }
}

// Visitor

protocol PlanetVisitor {
    func visit(mercury: Mercury)
    func visit(earth: Earth)
    func visit(saturn: Saturn)
}

protocol VisitedPlanet {
    func isVisited(by planetVisitor: PlanetVisitor)
}

// Implementation of visitor

final class NamePlanetVisitor: PlanetVisitor {
    func visit(mercury: Mercury) {
        mercury.name = "Mercury"
    }

    func visit(earth: Earth) {
        earth.name = "Earth"
    }

    func visit(saturn: Saturn) {
        saturn.name = "Saturn"
    }
}

// Usage of pattern

let planets: [Planet] = [Mercury(), Earth(), Saturn()]
let nameVisitor = NamePlanetVisitor()
planets.forEach { $0.isVisited(by: nameVisitor) }

planets.forEach { print($0.name) }

//: [Next](@next)
