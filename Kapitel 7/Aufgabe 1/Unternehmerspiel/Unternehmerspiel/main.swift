//
//  main.swift
//  Unternehmerspiel
//
//  Created by Dr. Wolfram Schroers on 5/16/16.
//  Copyright © 2016 Wolfram Schroers. All rights reserved.
//

import Foundation

/// Mögliche Züge als Aufzählung.
enum Zugwahl: Int {
    case Arbeiten=1, Verhandeln, Faulenzen
}

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

// MARK: Hilfsfunktionen, um einen Zug auf einem Unternehmer
// auszuführen.

/// Liefert einen Spielerzug zurück.
func spielerZug(name:String) -> Zugwahl {
    // Ausgabe der Kurzanleitung.
    print("\(name) kann dieses Jahr:")
    print("1 - Arbeiten")
    print("2 - Verhandeln")
    print("Sonst – Faulenzen")
    print("Ihre Wahl:")

    // Eingabe und Auswertung des Spielzuges.
    let wahl = zahlenEingabe()
    if let zug = Zugwahl(rawValue: wahl) {
        return zug
    } else {
        return .Faulenzen
    }
}

/// Führe einen Zug auf dem Objekt aus.
func macheZug(spieler:Unternehmer, zug:Zugwahl) {
    // Auswertung des Spielerzugs.
    switch zug {
    case .Arbeiten:
        // Spieler arbeitet.
        print(" - Der Spieler arbeitet!")
        spieler.arbeite()

    case .Verhandeln:
        // Spieler verhandelt.
        print(" - Der Spieler verhandelt!")
        spieler.verhandle()

    default:
        // Steve macht nichts und faulenzt.
        break
    }
}

// MARK: Beginn des Hauptprogramms.

// Erzeuge die Unternehmer–Objekte.
let steve = Unternehmer()
let woz = Unternehmer()

// Das Spiel läuft über 10 Runden.
for var runde:Int=1; runde<=10; runde += 1 {
    // Ausgabe des Spielstandes.
    print("")
    print("Dies ist Jahr \(runde).")
    print("Spielstand Steve:")
    steve.aktuellerStand()
    print("Spielstand Woz:")
    woz.aktuellerStand()

    // Eingabe der Spielerzüge.
    let wahlSteve = spielerZug("Steve")
    let wahlWoz = spielerZug("Woz")

    // Ausführen beider Spielzüge.
    macheZug(steve, zug: wahlSteve)
    macheZug(woz, zug: wahlWoz)
}

// Ausgabe des Ergebnisses am Spielende.
print("")
print("10 Jahre sind vorbei. Das Ergebnis lautet:")
print("Spielstand Steve:")
steve.aktuellerStand()
print("Spielstand Woz:")
woz.aktuellerStand()
