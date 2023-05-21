import UIKit

/* make a protocol that describes a building, adding various properties and methods, then create two structs, House and Office, that conform to it. Your protocol should require the following:

 A property storing how many rooms it has.
 A property storing the cost as an integer (e.g. 500,000 for a building costing $500,000.)
 A property storing the name of the estate agent responsible for selling the building.
 A method for printing the sales summary of the building, describing what it is along with its other properties. */

protocol Building {
    var type: String { get }
    var rooms: Int { get set }
    var cost: Int { get set }
    var agent: String { get set }
    
    func printSummary()
}

extension Building {
    func printSummary() {
        print("This is a \(type) with \(rooms) rooms. It costs \(cost) and is being sold by \(agent).")
    }
}

struct House: Building {
    var type = "house"
    var rooms: Int
    var cost: Int
    var agent: String
}

struct Office: Building {
    var type = "building"
    var rooms: Int
    var cost: Int
    var agent: String
}

let house = House(rooms: 5, cost: 500_000, agent: "Rob")
let office = Office(rooms: 90, cost: 1_000_000, agent: "Julia")

house.printSummary()
office.printSummary()
