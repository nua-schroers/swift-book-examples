//: Playground - noun: a place where people can play

import UIKit

/// Ein Sandwich mit einem Namen.
struct Sandwich {
    /// Der Name des Sandwich.
    var name:String

    /// Normale Initialisierung mit einem Standardnamen.
    init() {
        name = "Erdnussbutter und Gelee"
    }

    /// Alternative Initialisierung mit eigenem Namen.
    init(customName:String) {
        name = customName
    }
}

// Anwendungsbeispiele
var bestellung1 = Sandwich()
let bestellung2 = Sandwich(customName: "Käse")
var bestellung3 = bestellung1

// Jetzt:
// bestellung1.name ist "Erdnussbutter und Gelee".
// bestellung2.name ist "Käse".
// bestellung3.name ist "Erdnussbutter und Gelee".

// Ändere den Namen von Bestellung 1.
bestellung1.name = "Schinken und Käse"

// Jetzt:
// bestellung1.name ist "Schinken und Käse".
// bestellung2.name ist "Käse".
// bestellung3.name ist "Erdnussbutter und Gelee".
