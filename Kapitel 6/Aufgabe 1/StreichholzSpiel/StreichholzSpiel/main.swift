//
//  main.swift
//  StreichholzSpiel
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

/// Liefere eine Zufallszahl zwischen unten und oben (beide
/// einschließlich).
func zufallsZahl(unten:Int = 1, oben:Int = 3) -> Int {
    // Liefere eine Zufallszahl zwischen unten und oben.
    let zufall = arc4random_uniform(UInt32(oben - unten + 1))
    let ergebnis = unten + Int(zufall)

    // Gib sie zurück.
    return ergebnis
}

/// Liefere die maximale Zahl an Hölzern, die ein Spieler derzeit
/// nehmen kann.
func grenze(hoelzerUebrig:Int, nimmMaximum:Int = 3) -> Int {
    // Die Grenze ist maximal nimmMaximum Hölzer (Standard: 3).
    var ergebnis = nimmMaximum

    if hoelzerUebrig < nimmMaximum {
        // Weniger als nimmMaximum Hölzer sind übrig, korrigiere den Wert.
        ergebnis = hoelzerUebrig
    }

    // Gib das Ergebnis zurück.
    return ergebnis
}

/// Bestimme den Computerzug, benutze den Zufallsgenerator.
func computerZug(hoelzerUebrig:Int, nimmMaximum:Int = 3) -> Int {
    // Die maximale Zahl an Hölzern, die der Computer nehmen darf.
    let nimmHoechstens = grenze(hoelzerUebrig, nimmMaximum: nimmMaximum)

    // Der Zug ist eine Zufallszahl zwischen 1 und nimmHoechstens.
    return zufallsZahl(oben:nimmHoechstens)
}

/// Fragt einen Spielerzug ab. Es wird so lange gefragt, bis ein
/// gültiger Zug eingegeben wurde.
func spielerZug(hoelzerUebrig:Int, nimmMaximum:Int = 3) -> Int {
    // Die Maximalzahl der Hölzer, die der Spieler nehmen darf.
    let nimmHoechstens = grenze(hoelzerUebrig, nimmMaximum: nimmMaximum)

    // Der aktuelle Spielerzug.
    var nimmHoelzer = 0

    // Ist die Spielereingabe gültig?
    var zugGueltig = false

    // Anweisung für den Spieler.
    print("Geben Sie Ihren Zug ein (zwischen 1 und \(nimmHoechstens)):")
    while !zugGueltig {
        // Eingabe des Spielerzuges.
        nimmHoelzer = zahlenEingabe()

        if (nimmHoelzer >= 1) && (nimmHoelzer <= nimmHoechstens) {
            // Der Spielerzug ist gültig, verlasse die while–Schleife.
            zugGueltig = true
        } else {
            // Der Spielerzug ist ungültig, wiederhole die Eingabe.
            print("Kein gültiger Zug! Bitte nochmals eingeben:")
        }
    }

    // Den gültigen Spielerzug zurückgeben.
    return nimmHoelzer
}

// Anfang des Spiels.
print("Herzlich Willkommen zum Streichholzspiel.")
print("Wer das letzte Hölzchen wegnimmt, verliert.")

// Anfängliche Zahl der Hölzer.
var hoelzer = 18

// Hauptschleife des Spiels.
while true {
    // Gib den aktuellen Spielstand aus.
    print("Es sind noch \(hoelzer) Hölzer übrig.")

    // Der erste Spieler macht seinen Zug.
    print("Spieler 1 ist am Zug!")
    hoelzer = hoelzer - spielerZug(hoelzer)

    if hoelzer == 0 {
        // Spieler 1 nimmt das letzte Hölzchen.
        print("Spieler 2 hat gewonnen!")
        break
    }

    // Gib den aktuellen Spielstand aus.
    print("Es sind noch \(hoelzer) Hölzer übrig.")

    // Der zweite Spieler seinen Zug.
    print("Spieler 2 ist am Zug!")
    hoelzer = hoelzer - spielerZug(hoelzer)

    if hoelzer == 0 {
        // Spieler 2 nimmt das letzte Hölzchen.
        print("Spieler 1 hat gewonnen!")
        break
    }
}

