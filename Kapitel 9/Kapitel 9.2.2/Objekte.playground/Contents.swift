//: Playground - noun: a place where people can play

import UIKit

/// Eine Angestellte mit einem Chef.
class Angestellte {
    /// Eine Eigenschaft für den Chef.
    weak var chef:Unternehmer?

    /// Die init–Methode setzt den Chef nun automatisch.
    init (chef:Unternehmer?) {
        self.chef = chef
        print("Angestellte init")
    }

    deinit {
        print("Angestellte deinit")
    }
}

/// Ein Unternehmer mit Sekretärin.
class Unternehmer {
    /// Eine Eigenschaft für die Sekretärin.
    var sekretaerin:Angestellte?

    // Kontrollausgaben, um die Erzeugung und Vernichtung zu verfolgen.
    init () {
        self.sekretaerin = Angestellte(chef:self)
        print("Unternehmer init")
    }

    deinit {
        print("Unternehmer deinit")
    }
}

// Anwendungen:
let block1 = {
    var steve = Unternehmer()

    print("Neue Zuweisung:")
    steve = Unternehmer()
}

let block2 = {
    // Erzeuge einen neuen Unternehmer.
    var steve = Unternehmer()

    // Speichere seine Sekretärin in der Variable johanna.
    var johanna = steve.sekretaerin

    // Gib den Inhalt von johanna aus.
    print("Inhalt von johanna: \(johanna)")

    // Ersetze steve durch ein neues Objekt.
    steve = Unternehmer()

    // Gib den neuen Inhalt von johanna aus.
    print("Inhalt von johanna: \(johanna)")
}

print("Operationen in Block1:")
block1()

print("\nOperationen in Block2:")
block2()
