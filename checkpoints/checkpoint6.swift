import UIKit

/* create a struct to store information about a car, including its model, number of seats, and current gear, then add a method to change gears up or down. Have a think about variables and access control: what data should be a variable rather than a constant, and what data should be exposed publicly? Should the gear-changing method validate its input somehow? */

struct Car {
    let model: String
    let seats: Int
    private(set) var currentGear = 1
    
    enum error: Error {
        case invalidGear
    }
    
    init(model: String, seats: Int) {
        self.model = model
        self.seats = seats
    }
    
    mutating func upGear(by increment: Int) throws {
        if currentGear + increment > 10 {
            throw error.invalidGear
        } else {
            currentGear += increment
        }
    }
    
    mutating func downGear(by increment: Int) throws {
        if currentGear - increment < 1 {
            throw error.invalidGear
        } else {
            currentGear -= increment
        }
    }
    
    func printInfo() {
        print(model)
        print(seats)
        print(currentGear)
    }
}

var audi = Car(model: "X67", seats: 4)

do {
    try audi.upGear(by: 5)
} catch {
    print("invalid gear change")
}

audi.printInfo()

do {
    try audi.downGear(by: 10)
} catch {
    print("invalid gear change")
}
