//: Playground - noun: a place where people can play

import UIKit

/// Definition der Klasse Angestellte.
class Angestellte {
    // Kontrollausgaben, um die Erzeugung und Vernichtung zu verfolgen.
    init () {
        print("Angestellte init")
    }

    deinit {
        print("Angestellte deinit")
    }

    // Diese Definition enthält keine wirklich "nützlichen"
    // Eigenschaften und Methoden.
}

/// Ein Unternehmer mit Sekretärin.
class Unternehmer {
    /// Eine Eigenschaft für die Sekretärin.
    var sekretaerin:Angestellte = Angestellte()

    // Kontrollausgaben, um die Erzeugung und Vernichtung zu verfolgen.
    init () {
        print("Unternehmer init")
    }

    deinit {
        print("Unternehmer deinit")
    }
}

// Anwendung:
var steve = Unternehmer()

print("Neue Zuweisung:")
steve = Unternehmer()

