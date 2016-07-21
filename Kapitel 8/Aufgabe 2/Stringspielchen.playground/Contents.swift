//: Playground - noun: a place where people can play

import UIKit

// Ein String, der mehrmals das Wort "Euro" enthält.
let eingabe = "Addieren von 34 Euro und 67 Euro ergibt 101 Euro."

// Liefert eine Range–Konstante, die angibt, an welcher
// Stelle der Teilstring enthalten ist.
let suchBereich = eingabe.rangeOfString("griech", options: .CaseInsensitiveSearch)

// Kontrolliere, ob der Bereich nicht leer ist.
var ausgabe = eingabe
if let gefundenerBereich = suchBereich {
    // Der Teilstring wurde gefunden!
    ausgabe = eingabe.stringByReplacingOccurrencesOfString("Euro",
                                                           withString: "Drachmen")
}

// Ausgabe des Ergebnisses:
// Addieren von 34 Drachmen und 67 Drachmen ergibt 101 Drachmen.
print(ausgabe)

