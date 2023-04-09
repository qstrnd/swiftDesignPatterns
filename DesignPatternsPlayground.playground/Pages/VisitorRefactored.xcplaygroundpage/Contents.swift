//: [Previous](@previous)

import Foundation

// Domain

class Planet {
    var name: String = ""
}

final class Mercury: Planet {}

final class Earth: Planet {}

final class Saturn: Planet {}

// Visitor

protocol PlanetVisitor {
    func visit(mercury: Mercury)
    func visit(earth: Earth)
    func visit(saturn: Saturn)
}

protocol VisitedPlanet {
    func isVisited(by planetVisitor: PlanetVisitor)
}

// Extension of domain

extension Mercury: VisitedPlanet {
    func isVisited(by planetVisitor: PlanetVisitor) {
        planetVisitor.visit(mercury: self)
    }
}

extension Earth: VisitedPlanet {
    func isVisited(by planetVisitor: PlanetVisitor) {
        planetVisitor.visit(earth: self)
    }
}

extension Saturn: VisitedPlanet {
    func isVisited(by planetVisitor: PlanetVisitor) {
        planetVisitor.visit(saturn: self)
    }
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
let visitedPlanets = planets.compactMap { $0 as? VisitedPlanet }
let nameVisitor = NamePlanetVisitor()
visitedPlanets.forEach { $0.isVisited(by: nameVisitor) }

planets.forEach { print($0.name) }

//: [Next](@next)
