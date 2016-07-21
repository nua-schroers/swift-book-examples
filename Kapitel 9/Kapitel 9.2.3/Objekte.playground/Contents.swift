//: Playground - noun: a place where people can play

import UIKit

/// Ein Unternehmer mit einer (optionalen) Firma.
class Unternehmer {
    var unternehmen:Firma?
}

/// Eine Firma, die zwingend einen Gründer haben muss.
class Firma {
    unowned var gruender:Unternehmer

    // Erzeuge die Firma durch einen vorhandenen Gründer.
    init (gruender: Unternehmer) {
        // Weise diesem Objekt den Gründer zu.
        self.gruender = gruender

        // Weise dem Gründer diese Firma zu.
        self.gruender.unternehmen = self
    }
}

// Erzeuge einen Unternehmer.
var steve = Unternehmer()

// Dieser gründet eine Firma.
var apple = Firma(gruender: steve)

// Kontrollausgabe für beide Objekte.
if steve === apple.gruender {
    print("Steve ist der Gründer von Apple.")
}

