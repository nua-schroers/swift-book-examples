//: Playground - noun: a place where people can play

import UIKit

/// Klasse mit Kontrollausgabe für init und deinit.
class Unternehmer {
    init () {
        print("Unternehmer init")
    }

    deinit {
        print("Unternehmer deinit")
    }
}

// Erzeuge das Objekt in einem Block.
print("Vor dem Block")
if (true) {
    var steve = Unternehmer()
    print("Steve wurde erzeugt")
}
print("Hinter dem Block")
