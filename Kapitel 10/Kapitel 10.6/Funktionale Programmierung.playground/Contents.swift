//: Playground - noun: a place where people can play

import UIKit

// Deklaration einer Funktion als Variable
var eineFunktion:(Int) -> Int

/// Eine Funktion, die zu Ihrem Parameter 2 addiert und zurückgibt.
func addiereZwei(x:Int) -> Int {
    return x + 2
}

// Weise diese Funktion der Variablen eineFunktion zu.
eineFunktion = addiereZwei

// Dies liefert als Ergebnis 7.
eineFunktion(5)

/// Liefere eine Funktion zurück, die einen Zuschlag zu Ihrem Argument
/// addiert.
func erzeugeAddierer(zuschlag:Int) -> (Int) -> Int {
    // Addiere zuschlag zum Parameter.
    func addiere(x:Int) -> Int {
        return x + zuschlag
    }

    // Liefere die Funktion addiere zurück.
    return addiere
}

// Erzeuge einen addierer für die Zahl 10 und weise ihn eineFunktion zu.
eineFunktion = erzeugeAddierer(10)

// Dies liefert als Ergebnis 15.
eineFunktion(5)

// Alternative Schreibweise
func erzeugeAddiererAlt(zuschlag:Int) -> (Int) -> Int {
    return { x in return x + zuschlag }
}
let eineFunktionAlt = erzeugeAddierer(10)
eineFunktionAlt(5)

// Definiere ein Array.
var zahlenReihe = [1, 2, 3, 4, 5]

// Quadriere jede Zahl.
var quadrate = zahlenReihe.map({ x in return x*x })

// Dies liefert [1, 4, 9, 16, 25].
quadrate

// Alternative Schreibweise
quadrate = zahlenReihe.map { x in return x*x }

// Generische Funktionen

// Gib einen Wert eines beliebigen Typs aus.
func ausgabe<T>(wert:T) {
    print("\(wert)")
}

// Beispiel: Ausgabe eines Int–Wertes.
ausgabe(3)

// Ausgabe eines String.
ausgabe("Hallo")

