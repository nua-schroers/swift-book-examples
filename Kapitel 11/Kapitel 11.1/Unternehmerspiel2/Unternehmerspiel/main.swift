//
//  main.swift
//  Unternehmerspiel
//
//  Created by Dr. Wolfram Schroers on 5/16/16.
//  Copyright © 2016 Wolfram Schroers. All rights reserved.
//

import Foundation

// MARK: Hilfsfunktion.

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

// MARK: Beginn des Hauptprogramms.

// Erzeuge ein Angestellter–Objekt, speichere es als woz.
let woz = Angestellter()

// Das Spiel läuft über 10 Runden.
for var runde:Int=1; runde<=10; runde+=1 {
    // Ausgabe des Spielstandes.
    print("")
    print("Dies ist Jahr \(runde).")
    woz.aktuellerStand()

    // Eingabe des Spielerzugs.
    print("Soll Woz dieses Jahr:")
    print("1 – Arbeiten")
    print("2 – Überstunden machen")
    print("Sonst – Faulenzen")
    print("Ihre Wahl:")
    let wahl = zahlenEingabe()

    // Auswertung des Spielerzugs.
    switch wahl {
    case 1:
        // Woz arbeitet.
        print(" - Woz arbeitet!")
        woz.arbeite()

    case 2:
        // Woz macht Überstunden.
        print(" - Woz macht Überstunden!")
        woz.macheUeberstunden()
        
    default:
        // Woz macht nichts und faulenzt.
        break
    }
}

// Ausgabe des Ergebnisses am Spielende.
print("")
print("10 Jahre sind vorbei. Das Ergebnis lautet:")
woz.aktuellerStand()
