//
//  main.swift
//  ZinsRechner
//
//  Created by Dr. Wolfram Schroers on 5/16/16.
//  Copyright © 2016 Wolfram Schroers. All rights reserved.
//

import Foundation

/// Eine Funktion, die eine Zahl vom Benutzer annimmt und
/// dem Aufrufer zurückgibt.
func zahlenEingabe() -> Int {
    // Benutzereingabe erfragen.
    let benutzerEingabe = NSFileHandle.fileHandleWithStandardInput().availableData

    // Benutzereingabe in einem String umwandeln.
    let eingabeString = NSString(data: benutzerEingabe, encoding: NSUTF8StringEncoding)

    // Den String in eine Zahl umwandeln, wenn möglich.
    let eingegebeneZahl = eingabeString?.integerValue

    // Gib die Zahl an einen anderen Programmteil.
    switch eingegebeneZahl {
    case _ where eingegebeneZahl != nil:
        // Fallunterscheidung: eine vernünftige Zahl wurde eingegeben.
        return eingegebeneZahl!
    default:
        // Ansonsten: irgendwas anderes wurde eingegeben.
        return 0
    }
}

// Eingabe des Startkapitals, des Zinssatzes und der Laufzeit.
print("Bitte geben Sie das Startkapital an:")
var kapital:Double = Double(zahlenEingabe())
print("Bitte geben Sie den Zinssatz ein:")
let zinssatz:Double = Double(zahlenEingabe())
print("Bitte geben Sie die Laufzeit ein:")
let laufzeit = zahlenEingabe()

// Schleife über die Laufzeit.
for var jahr = 1; jahr<=laufzeit; jahr += 1 {
    // Berechnung.
    kapital += kapital * zinssatz/100

    // Ausgabe.
    if jahr == 1 {
        // Sonderfall: das erste Jahr.
        print("Kapital nach einem Jahr: \(kapital)")
    } else {
        // Regelfall: alle späteren Jahre.
        print("Kapital nach \(jahr) Jahren: \(kapital)")
    }
}

// Ausgabe des Endergebnisses.
print("\nKapital am Ende nach \(laufzeit) Jahren: \(kapital)")
