//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// MARK: Abschnitt 3.2 - Variablen: Es kommt auf die Werte an

str = "Hallo, Spielwiese"

var aepfel = 34
let birnen = 67
var allesObst = aepfel + birnen
// Hier ist allesObst = 101.

// Ändern eines Wertes.
aepfel = 10

// Jetzt ist aepfel = 10, aber allesObst immer noch 101.
aepfel
allesObst

allesObst = aepfel + birnen
// Jetzt ist aepfel = 10 und allesObst 77.

// MARK: Abschnitt 3.3 - Datentypen: Von Zeichen, Texten und Zahlen

var schulNote1 = "Sehr gut"
var schulNote3:String
schulNote3 = "Befriedigend"

// Variable mit dem Startkapital.
var Kapital:Double = 100.0

// Das Kapital nach einem Jahr.
Kapital += Kapital * 0.05

// Das Kapital nach zwei Jahren.
Kapital += Kapital * 0.05

// Das Kapital nach drei Jahren.
Kapital += Kapital * 0.05

// MARK: Abschnitt 3.4 - Bool: Der (Daten-)Typ der Wahrheit

// Das Alter von Steve.
var alterSteve = 25

// Das Alter von Woz.
var alterWoz = 23

// Entscheidung: Ist Steve älter?
var steveIstAelter = alterSteve > alterWoz

// Wenn ja, Ausgabe.
if steveIstAelter {
    print("Steve ist älter.")
}

// Alternative ohne Variable.
if alterSteve > alterWoz {
    print("Steve ist älter.")
}

// Eine Variable, die das Ergebnis des Vergleiches enthält.
var gleichAlt = alterSteve == alterWoz

// Ausgabe nur, wenn gleichAlt true ist.
if gleichAlt {
    print("Steve und Woz sind beide gleich alt.")
}

// MARK: Abschnitt 3.6 - Fortgeschrittenes

var a:Float = 100000000.0 + 1.0
a = a - 100000000.0
print("Ergebnis: \(a).")

var i:Int = 100000000 + 1
i = i - 100000000
print("Ergebnis: \(i).")

// MARK: Abschnitt 4.2

/// Eine einfache Funktion ohne Parameter und ohne Rückgabewert.
func halloWelt() -> () {
    print("Hallo Welt!")
}

halloWelt()

/// Liefere einen String zurück, der einen String enthält,
/// welcher das Alter von Steve und Woz vergleicht.
func vergleicheAlter(alterSteve:Int, alterWoz:Int) -> String {
    if alterSteve == alterWoz {
        return "Steve und Woz sind gleich alt"
    }
    // TODO: Schreiben Sie die Funktion fertig!
    return ""
}

vergleicheAlter(25, alterWoz: 25)
vergleicheAlter(23, alterWoz: 25)

// MARK: Abschnitt 4.4.3

/// Verdoppel eine Ganzzahl.
func verdoppelMich(zahl:Int) -> Int {
    return 2*zahl
}

/// Verdoppel eine Fließkommazahl.
func verdoppelMich(zahl:Double) -> Double {
    return 2.0*zahl
}

/// Verdoppel einen Text.
func verdoppelMich(text:String) -> String {
    return "\(text)\(text)"
}

// Anwendungsbeispiele:
verdoppelMich(5) // Ergebnis: 10
verdoppelMich(3.5) // Ergebnis: 7.0
verdoppelMich("Supergeil!") // Ergebnis: "Supergeil!Supergeil!"

