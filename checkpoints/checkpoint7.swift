import UIKit

/*
 make a class hierarchy for animals, starting with Animal at the top, then Dog and Cat as subclasses, then Corgi and Poodle as subclasses of Dog, and Persian and Lion as subclasses of Cat.

 The Animal class should have a legs integer property that tracks how many legs the animal has.
 The Dog class should have a speak() method that prints a generic dog barking string, but each of the subclasses should print something slightly different.
 The Cat class should have a matching speak() method, again with each subclass printing something different.
 The Cat class should have an isTame Boolean property, provided using an initializer.
 */

class Animal {
    var legs: Int
    
    init(legs: Int) {
        self.legs = legs
    }
}

class Dog: Animal {
    init() {
        super.init(legs: 4)
    }
    
    func speak() {
        print("woof woof")
    }
}

final class Corgi: Dog {
    override func speak() {
        print("woof corgi woof")
    }
}

final class Poodle: Dog {
    override func speak() {
        print("woof poodle woof")
    }
}

class Cat: Animal {
    var isTame: Bool
    
    init(isTame: Bool) {
        self.isTame = isTame
        super.init(legs: 4)
    }
    
    func speak() {
        print("meow meow")
    }
}

final class Persian: Cat {
    init() {
        super.init(isTame: true)
    }
    
    override func speak() {
        print("meow persian meow")
    }
}

final class Lion: Cat {
    init() {
        super.init(isTame: false)
    }
    
    override func speak() {
        print("roar")
    }
}

let animal = Animal(legs: 2)

let dog = Dog()
dog.speak()

let corgi = Corgi()
corgi.speak()

let poodle = Poodle()
poodle.speak()

let cat = Cat(isTame: true)
cat.speak()

let persian = Persian()
persian.speak()

let lion = Lion()
lion.speak()
