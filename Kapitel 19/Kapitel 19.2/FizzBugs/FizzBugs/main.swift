//
//  main.swift
//  FizzBugs
//
//  Created by Dr. Wolfram Schroers on 5/23/16.
//  Copyright © 2016 Wolfram Schroers. All rights reserved.
//

import Foundation

/// Eine fehlerhafte fizzBuzz-Funktion, die falsche Ergebnisse
/// liefert.
func fizzBuzz(x:Int) -> (String) {
    // Deklariere das Ergebnis.
    var ergebnis:String

    if (x % 3 == 0) {
        // Fall: Teilbar durch 3.
        ergebnis = "Fizz"
    } else {
        if (x % 5 == 0) {
            // Fall: Teilbar durch 5.
            ergebnis = "Buzz"
        } else {
            if (x % 15 == 0) {
                // Fall: Teilbar durch 15.
                ergebnis = "FizzBuzz"
            } else {
                // Ansonsten: eine normale Zahl.
                ergebnis = String(x)
            }
        }
    }

    // Gib das Ergebnis zurück.
    return ergebnis
}

// Rufe fizzBuzz mit den Zahlen von 1 bis 100 auf.
for var wert=1; wert<=100; wert+=1 {
    // Gewünschte Ausgabe als String.
    let ausgabe = fizzBuzz(wert)
    
    // Gib den String am Bildschirm aus.
    print("\(ausgabe)")
}
