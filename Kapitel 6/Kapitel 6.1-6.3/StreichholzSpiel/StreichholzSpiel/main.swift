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

/// Bestimme den Computerzug, benutze den Zufallsgenerator.
func computerZug(hoelzerUebrig:Int, nimmMaximum:Int = 3) -> Int {
    // Die maximale Zahl an Hölzern, die der Computer nehmen darf.
    var nimmHoechstens = nimmMaximum

    if hoelzerUebrig < nimmMaximum {
        // Weniger als drei Hölzer sind übrig, korrigiere den Wert.
        nimmHoechstens = hoelzerUebrig
    }

    // Der Zug ist eine Zufallszahl zwischen 1 und nimmHoechstens.
    return zufallsZahl(oben:nimmHoechstens)
}

/// Fragt einen Spielerzug ab. Es wird so lange gefragt, bis ein
/// gültiger Zug eingegeben wurde.
func spielerZug(hoelzerUebrig:Int, nimmMaximum:Int = 3) -> Int {
    // Die Maximalzahl der Hölzer, die der Spieler nehmen darf.
    var nimmHoechstens = nimmMaximum

    if hoelzerUebrig < nimmMaximum {
        // Weniger als drei Hölzer sind übrig, korrigiere den Wert.
        nimmHoechstens = hoelzerUebrig
    }

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

// Anfängliche Zahl der Hölzer.
var hoelzer = 18

// Hauptschleife des Spiels.
while true {
    print("Es sind noch \(hoelzer) Hölzer übrig.")

    // Spielerzug ausführen.
    hoelzer = hoelzer - spielerZug(hoelzer)

    if hoelzer == 0 {
        // Der Spieler hat bei seinem Zug das letzte Hölzchen entfernt.
        print("Ihr Mac hat gewonnen!")
        break
    }

    // Computerzug ausführen.
    hoelzer = hoelzer - computerZug(hoelzer)

    if hoelzer == 0 {
        // Der Mac hat bei seinem Zug das letzte Hölzchen entfernt.
        print("Sie haben gewonnen!")
        break
    }
}

