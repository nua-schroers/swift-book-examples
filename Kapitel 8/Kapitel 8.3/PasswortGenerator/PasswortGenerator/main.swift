//
//  main.swift
//  PasswortGenerator
//
//  Created by Dr. Wolfram Schroers on 5/16/16.
//  Copyright © 2016 Wolfram Schroers. All rights reserved.
//

import Foundation

/// Liefere eine Zufallszahl zwischen unten und oben (beide
/// einschließlich).
func zufallsZahl(unten:Int = 1, oben:Int = 3) -> Int {
    // Liefere eine Zufallszahl zwischen unten und oben.
    let zufall = arc4random_uniform(UInt32(oben - unten + 1))
    let ergebnis = unten + Int(zufall)

    // Gib sie zurück.
    return ergebnis
}

/// Erzeuge eine Ziffer von '0' bis '9'.
func zufallsZifferZeichen() -> Character {
    // Erzeuge einen zufälligen ASCII–Wert einer Ziffer.
    let zahl = zufallsZahl(48, oben: 57)

    // Wandle den ASCII–Wert in das Zeichen um.
    let ergebnis = Character(UnicodeScalar(zahl))

    // Gib es als Ergebnis zurück.
    return ergebnis
}

/// Erzeuge eine Ziffer von '0' bis '9' oder einen Groß- oder
/// einen Kleinbuchstaben.
func zufallsZeichen() -> Character {
    // Dies soll der zufällige ASCII–Wert sein.
    var asciiWert = 0

    // Die Schleife soll so lange laufen, bis der
    // ASCII–Wert entweder eine Ziffer, ein Großbuchstabe
    // oder ein Kleinbuchstabe ist.
    while (!((asciiWert >= 48) && (asciiWert <= 57)) &&
           !((asciiWert >= 65) && (asciiWert <= 90)) &&
           !((asciiWert >= 97) && (asciiWert <= 122))) {
        // Erzeugt einen neuen ASCII–Wert.
        asciiWert = zufallsZahl(48, oben: 122)
    }

    // Wandle den Wert in ein Zeichen um.
    let ergebnis = Character(UnicodeScalar(asciiWert))

    // Gib das Zeichen zurück.
    return ergebnis
}

/// Erzeuge ein Passwort bestehend aus 8 zufällig erzeugten
/// Ziffern.
func passwort() -> String {
    // Das anfängliche Passwort ist leer.
    var passwort = ""

    // Füge 8 einzelne Zifferzeichen hinzu.
    for var i=1; i<=8; i+=1 {
        // Hänge ein zufälliges Zifferzeichen an das bestehende
        // Passwort an.
        passwort.append(zufallsZifferZeichen())
    }

    // Gib das Passwort als Ergebnis zurück.
    return passwort
}

// Erzeuge ein Passwort.
let meinPasswort = passwort()

// Gib es auf dem Bildschirm aus.
print("Neues Passwort: \(meinPasswort)")
