//: Playground - noun: a place where people can play

import UIKit

// MARK: Fizzbuzz

//// Alternative Form von fizzBuzz, bei der die
/// Reihenfolge der Tests nicht mehr entscheidend ist.
func fizzBuzz(x:Int) -> (String) {
    // Zwischenspeichern des Ergebnisses.
    var ergebnis = ""

    // x ist durch 3 teilbar.
    // (Beachten Sie, dass "Fizz" auch dann ausgegeben wird,
    // wenn x durch 15 teilbar ist!)
    if x % 3 == 0 {
        ergebnis = "Fizz"
    }

    // x ist durch 5 teilbar.
    // (Beachten Sie, dass dies an "Fizz" angehängt wird,
    // falls x durch 15 teilbar ist!)
    if x % 5 == 0 {
        ergebnis += "Buzz"
    }

    // x ist weder durch 3 noch durch 5 teilbar.
    if (x % 3 != 0) && (x % 5 != 0) {
        ergebnis = String(x)
    }

    // Liefere das Ergebnis zurück.
    return ergebnis
}

// Rufe fizzBuzz mit den Zahlen von 1 bis 100 auf.
for var wert=1; wert<=100; wert+=1 {
    // Gewünschte Ausgabe als String.
    let ausgabe = fizzBuzz(wert)

    // Gib den String am Bildschirm aus.
    print("\(ausgabe)")
}

