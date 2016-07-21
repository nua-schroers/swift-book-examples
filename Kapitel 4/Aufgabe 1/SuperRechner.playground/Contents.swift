//: Playground - noun: a place where people can play

import UIKit

// Feste Anfangswerte
let laufzeit = 10
let zinssatz = 5.0
var kapital = 1000.0

// Schleife über die Laufzeit
for var jahr = 1; jahr<=laufzeit; jahr += 1 {
    // Berechnung
    kapital += kapital * zinssatz/100

    // Ausgabe
    print("Kapital nach \(jahr) Jahren: \(kapital)")
}
