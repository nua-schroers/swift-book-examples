//
//  PasswortModell.swift
//  PasswortApp
//
//  Created by Dr. Wolfram Schroers on 5/20/16.
//  Copyright © 2016 Wolfram Schroers. All rights reserved.
//

import Foundation

/// Arten einse Passworts: Soll das Passwort nur Ziffern,
/// auch Buchstaben oder auch Sonderzeichen enthalten?
enum PasswortTyp {
    case Ziffern
    case Buchstaben
    case Sonderzeichen
}

/// Das Datenmodell zur Erzeugung eines Passworts.
class PasswortModell {

    /// Typ des Passworts.
    var passWortTyp:PasswortTyp = .Buchstaben

    /// Die Passwortlänge. Anfangswert ist 8.
    var laenge = 8

    /// Liefere eine Zufallszahl zwischen unten und oben (beide
    /// einschließlich).
    func zufallsZahl(unten:Int = 1, oben:Int = 3) -> Int {
        // Liefere eine Zufallszahl zwischen oben und unten.
        let zufall = arc4random_uniform(UInt32(oben - unten + 1))
        let ergebnis = unten + Int(zufall)

        // Gib sie zurück.
        return ergebnis
    }

    /// Erzeuge eine Ziffer von '0' bis '9'.
    func zufallsZifferZeichen() -> Character {
        // Erzeuge einen zufälligen ASCII-Wert einer Ziffer.
        let zahl = zufallsZahl(48, oben: 57)

        // Wandle den ASCII-Wert in das Zeichen um.
        let ergebnis = Character(UnicodeScalar(zahl))

        // Gib es als Ergebnis zurück.
        return ergebnis
    }

    /// Erzeuge eine Ziffer von '0' bis '9' oder einen Groß- oder
    /// einen Kleinbuchstaben.
    func zufallsZeichen() -> Character {
        // Dies soll der zufällige ASCII-Wert sein.
        var asciiWert = 0

        // Die Schleife soll so lange laufen, bis der
        // ASCII-Wert entweder eine Ziffer, ein Großbuchstabe
        // oder ein Kleinbuchstabe ist.
        while (!((asciiWert >= 48) && (asciiWert <= 57)) &&
            !((asciiWert >= 65) && (asciiWert <= 90)) &&
            !((asciiWert >= 97) && (asciiWert <= 122))) {
                // Erzeugt einen neuen ASCII-Wert.
                asciiWert = zufallsZahl(48, oben: 122)
        }

        // Wandle den Wert in ein Zeichen um.
        let ergebnis = Character(UnicodeScalar(asciiWert))

        // Gib das Zeichen zurück.
        return ergebnis
    }

    /// Erzeuge eine Ziffer von '0' bis '9', einen Groß- oder
    /// einen Kleinbuchstaben oder ein Sonerzeichen ('.' oder ',').
    func zufallsSonderzeichen() -> Character {
        // Dies soll der zufällige ASCII-Wert sein.
        var asciiWert = 0

        // Die Schleife soll so lange laufen, bis der
        // ASCII-Wert entweder eine Ziffer, ein Großbuchstabe
        // oder ein Kleinbuchstabe oder ein Punkt oder Komma ist.
        while (!((asciiWert >= 48) && (asciiWert <= 57)) &&
            !((asciiWert >= 65) && (asciiWert <= 90)) &&
            !((asciiWert >= 97) && (asciiWert <= 122)) &&
            (asciiWert != 44) && (asciiWert != 46)) { // 44 ist '.', 46 ist ','.
                // Erzeugt einen neuen ASCII-Wert.
                asciiWert = zufallsZahl(44, oben: 122) // Der Bereich ist zu erweitern!
        }

        // Wandle den Wert in ein Zeichen um.
        let ergebnis = Character(UnicodeScalar(asciiWert))

        // Gib das Zeichen zurück.
        return ergebnis
    }

    /// Erzeuge ein Passwort bestehend aus self.laenge
    /// erzeugten Ziffern.
    func passwort() -> String {
        // Das anfängliche Passwort ist leer.
        var passwort = ""

        // Füge self.laenge einzelne Zifferzeichen hinzu.
        for var i=1; i<=self.laenge; i+=1 {
            // Hänge ein zufälliges Zifferzeichen an das bestehende
            // Passwort an.
            switch self.passWortTyp {
            case .Ziffern:
                passwort.append(self.zufallsZifferZeichen())
            case .Buchstaben:
                passwort.append(self.zufallsZeichen())
            case .Sonderzeichen:
                passwort.append(self.zufallsSonderzeichen())
            }
        }

        // Gib das Passwort als Ergebnis zurück.
        return passwort
    }
}
