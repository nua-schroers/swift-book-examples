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

/// Mögliche Züge als Aufzählung.
enum Zugwahl: Int {
    case Arbeiten=1, Verhandeln, Faulenzen
}

// MARK: Beginn des Hauptprogramms.

// Erzeuge ein Unternehmer–Objekt, speichere es als steve.
let steve = Unternehmer()

// Das Spiel läuft über 10 Runden.
for var runde:Int=1; runde<=10; runde += 1 {
    // Ausgabe des Spielstandes.
    print("")
    print("Dies ist Jahr \(runde).")
    steve.aktuellerStand()

    // Eingabe des Spielerzugs.
    print("Steve kann dieses Jahr:")
    print("1 – Arbeiten")
    print("2 – Verhandeln")
    print("Sonst – Faulenzen")
    print("Ihre Wahl:")
    let wahl = zahlenEingabe()

    // Umwandeln des Spielerzugs in eine Aufzählung.
    if let zug = Zugwahl(rawValue: wahl) {
        // Gültiger Zug: Auswertung des Spielerzugs.
        switch zug {
        case .Arbeiten:
            // Steve arbeitet.
            print(" - Steve arbeitet!")
            steve.arbeite()

        case .Verhandeln:
            // Steve verhandelt.
            print(" - Steve verhandelt!")
            steve.verhandle()

        default:
            // Steve macht nichts und faulenzt.
            break
        }
    } else {
        // Ungültiger Zug.
        // Auch hier: Steve macht nichts und faulenzt.
    }
}

// Ausgabe des Ergebnisses am Spielende.
print("")
print("10 Jahre sind vorbei. Das Ergebnis lautet:")
steve.aktuellerStand()
