//: Playground - noun: a place where people can play

import UIKit

/// Eine Klasse, die einen Holzhaufen repräsentiert. Er speichert die
/// Zahl der Hölzer und bietet die Funktionalität, Hölzer zu
/// entfernen.
class HolzHaufen {

    /// Eine Eigenschaft namens "hoelzer". Anfangswert ist 18.
    var hoelzer:Int = 18

    /// Diese Methode entfernt Streichhölzer.
    func entferneHoelzer(zahl:Int) {
        if self.hoelzer > zahl {
            // Es gibt genug Hölzer, entferne die gewünschte Zahl.
            self.hoelzer -= zahl
        } else {
            // Entferne alle Hölzer.
            self.hoelzer = 0
        }
    }
}

// Erzeuge eine Instanz.
let meinHaufen = HolzHaufen()

// Zeige die aktuelle Zahl der hoelzer an (dies sollte 18 sein).
meinHaufen.hoelzer

// Entferne 5 Hölzer aus dem Haufen.
meinHaufen.entferneHoelzer(5)

// Zeige die aktuelle Zahl der hoelzer an (nur noch 13).
meinHaufen.hoelzer

// Setze die Zahl der Hölzer auf 21.
meinHaufen.hoelzer = 21

// Erzeuge einen neuen, anderen Haufen.
let andererHaufen = HolzHaufen()

// Diese Objekt hat 18 Hölzer und ist völlig eigenständig.
andererHaufen.hoelzer

// Erzeuge eine neue Variable mit Inhalt von meinHaufen.
var derErsteHaufen = meinHaufen

// Dieser ist identisch mit dem ersten Haufen.
derErsteHaufen.hoelzer

// Wenn Sie ein Holz entfernen, so wirkt sich dies auf meinHaufen
// identisch aus.
derErsteHaufen.entferneHoelzer(1)

// Beide Haufen enthalten nun 20 Hölzer. 
derErsteHaufen.hoelzer
meinHaufen.hoelzer

