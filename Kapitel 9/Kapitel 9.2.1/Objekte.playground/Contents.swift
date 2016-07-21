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
    var sekretaerin:Angestellte? = Angestellte()

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

// Setze seine Sekretaerin auf nil.
print("Sekretärin auf nil setzen:")
steve.sekretaerin = nil

if let johanna = steve.sekretaerin {
    // johanna ist eine normale Konstante.
    // Das Angestellte–Objekt wird innerhalb dieses Blocks niemals
    // aus dem Speicher entfernt.
} else {
    // johanna kann nicht benutzt werden, da steve.sekretaerin nil war.
}

