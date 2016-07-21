//: Playground - noun: a place where people can play

import UIKit

// Erzeuge eine Ganzzahl–Konstante.
let zaehler = 1

// Dieser String lautet "Testausgabe 4".
let ganzzahlRechnung = "Testausgabe: \(zaehler+1+2)"

// Dieser String lautet "Testausgabe: 4.0".
let fliesskommaRechnung = "Testausgabe: \(Double(zaehler)+1.0+2.0)"

// Beispiel: Ersetzungen.
let nummer = 5
let fragenText = "Wieviel ist 2+2?"
let ergebnis = "Frage \(nummer): \(fragenText)"

// Erzeuge zwei Strings.
let ersterString = "abc"
let zweiterString = "abc"

// Führe den Vergleich durch, das Ergebnis ist hier true.
ersterString == zweiterString

// Erzeuge zwei Strings.
let ersterHalloString = "hello"
let zweiterHalloString = "HeLlO"

// Führe einen zeichenweisen Vergleich durch, dieser ist false.
ersterHalloString == zweiterHalloString

// Führe einen Vergleich ohne Unterscheidung von Groß- und
// Kleinschreibung durch, das Ergebnis ist hier true.
var vergleich = ersterHalloString.localizedCaseInsensitiveCompare(zweiterHalloString)
vergleich == NSComparisonResult.OrderedSame

// Erzeuge zwei Strings mit kyrillischen Zeichen.
let stringEins = "прИвЕТ"
let stringZwei = "ПрИвет"

// Führe einen Vergleich ohne Unterscheidung von Groß- und
// Kleinschreibung durch, das Ergebnis ist hier true.
vergleich = stringEins.localizedCaseInsensitiveCompare(stringZwei)
vergleich == NSComparisonResult.OrderedSame

// Ein String, der mehrmals das Wort "Euro" enthält.
let eingabe = "Addieren von 34 Euro und 67 Euro ergibt 101 Euro."

// Ersetzen von "Euro" durch "Drachmen".
let ausgabe = eingabe.stringByReplacingOccurrencesOfString("Euro",
                                                           withString:"Drachmen")

// Ausgabe des Ergebnisses:
// Addieren von 34 Drachmen und 67 Drachmen ergibt 101 Drachmen.
print(ausgabe)

