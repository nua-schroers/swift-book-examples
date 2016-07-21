//: Playground - noun: a place where people can play

import UIKit

// MARK: Fizzbuzz

/// Vollständige fizzBuzz–Funktion, liefere das regel–konforme
/// Ergebnis als String zurück.
func fizzBuzz(x:Int) -> (String) {
    // Deklariere das Ergebnis.
    var ergebnis:String

    if (x % 15 == 0) {
        // Fall: Teilbar durch 15.
        ergebnis = "FizzBuzz"
    } else {
        if (x % 5 == 0) {
            // Fall: Teilbar durch 5.
            ergebnis = "Buzz"
        } else {
            if (x % 3 == 0) {
                // Fall: Teilbar durch 3.
                ergebnis = "Fizz"
            } else {
                // Ansonsten: eine normale Zahl.
                ergebnis = String(x)
            }
        }
    }

    // Gib das Ergebnis zurück.
    return ergebnis
}

// Rufe fizzBuzz mit den Zahlen von 1 bis 100 auf.
for var wert=1; wert<=100; wert+=1 {
    // Gewünschte Ausgabe als String.
    let ausgabe = fizzBuzz(wert)

    // Gib den String am Bildschirm aus.
    print("\(ausgabe)")
}

// MARK: Sparpläne

/// Liefere das Gesamtguthaben für einen Sparplan zurück.
func sparplanNachJahren(n:Int, zinssatz:Double, einzahlung:Double)
    -> Double {
    // Das Anfangsguthaben.
    var neuesGuthaben = einzahlung

    // Schleife über alle Jahre.
    for var i=1; i<=n; i+=1 {
        // Jährliche Einzahlung.
        neuesGuthaben += einzahlung

        // Zinsen am Ende eines jeden Jahres.
        neuesGuthaben += neuesGuthaben * zinssatz/100.0
    }

    // Gib das Ergebnis zurück.
    return neuesGuthaben
}

// Leerzeile zur Abtrennung der alten Ausgabe.
print("")

// Der Sparplan des schlauen Steve.
print("Sparplan von Steve:")
var zinsen = 2.0
var zahlung = 50.0
var jahre = 45
var endGuthaben = sparplanNachJahren(jahre, zinssatz: zinsen, einzahlung: zahlung)
print("Steve hat im Alter von 60 Jahren \(endGuthaben) Euro.")

// Der Sparplan des gierigen Gil.
print("Sparplan von Gil:")
zinsen = 5.0
zahlung = 100.0
jahre = 15
endGuthaben = sparplanNachJahren(jahre, zinssatz: zinsen, einzahlung: zahlung)
print("Gil hat im Alter von 60 Jahren \(endGuthaben) Euro.")

// MARK: Abschnitt 5.3.2 - Alternative FizzBuzz-Funktion

/// Alternative Form von fizzBuzz, liefere die regelkonforme
/// Antwort als String zurück.
func fizzBuzzAlt(x:Int) -> (String) {
    // Deklariere das Ergebnis.
    var ergebnis:String

    switch x {
    case x where (x % 15) == 0:
        // Fall: Teilbar durch 15.
        ergebnis = "FizzBuzz"
    case x where (x % 5) == 0:
        // Fall: Teilbar durch 5.
        ergebnis = "Buzz"
    case x where (x % 3) == 0:
        // Fall: Teilbar durch 3.
        ergebnis = "Fizz"
    default:
        // Ansonsten: eine normale Zahl.
        ergebnis = String(x)
    }

    // Gib das Ergebnis zurück.
    return ergebnis
}

// MARK: Abschnitt 5.4.2 - Funktionen mit mehreren Rückgabewerten

/// Liefere ein Sparplanangebot zurück, bestehend aus Gesamt-
/// guthaben am Ende, Provision für den Verkäufer und dem Namen
/// als String.
func sparplanAngebot(n:Int, zinssatz:Double, einzahlung:Double)
    -> (Double, Double, String) {
    // Setze die Provision auf 50%.
    let meineProvision = 0.5

    // Berechne das Kapital mit Hilfe der Funktion sparplanNachJahren.
    // Berücksichtige dabei die Provision.
    let kapitalErgebnis = sparplanNachJahren(n,
                                             zinssatz:zinssatz,
                                             einzahlung:einzahlung - einzahlung * meineProvision)

    // Wähle einen verkaufsfördernden Namen.
    let name = "Supersichere Versicherung"

    // Gib das Ergebnis, die Verkaufsprovision und den Namen zurück.
    return (kapitalErgebnis, meineProvision, name)
}

// Hole ein Angebot ein.
let angebot1 = sparplanAngebot(5, zinssatz:5.0, einzahlung:100.0)
let kapitalAmEnde = angebot1.0
let provision = angebot1.1
let name = angebot1.2

/// Erstelle ein Sparplanangebot, indem die Kennzahlen bestehend aus
/// Gesamtguthaben am Ende, Provision für den Verkäufer und dem Namen
/// als String als veränderliche Parameter zurückgegeben werden.
func sparplanAngebot2(n:Int, zinssatz:Double, einzahlung:Double,
                      inout kapitalErgebnis:Double,
                      inout meineProvision:Double,
                      inout name:String) {
    // Setze die Provision auf 10%.
    meineProvision = 0.1

    // Berechne das Kapital mit Hilfe der Funktion sparplanNachJahren.
    // Berücksichtige dabei die Provision.
    kapitalErgebnis = sparplanNachJahren(n,
                                         zinssatz:zinssatz,
                                         einzahlung:einzahlung - einzahlung * meineProvision)

    // Die Provision ist niedrig, wähle einen unattraktiven Namen.
    name = "Riskantes Aktieninvestment"

    // Eine Rückgabe von Werten ist nun nicht mehr erforderlich!
}

// Hole ein weiteres Angebot ein.
// Zunächst müssen alle Variablen initialisiert werden:
var kapitalAmEnde2:Double = 0.0
var provision2:Double = 0.0
var name2:String = ""

// Dann kann die Funktion aufgerufen werden:
sparplanAngebot2(5, zinssatz: 5.0, einzahlung: 100.0,
                 kapitalErgebnis: &kapitalAmEnde2,
                 meineProvision: &provision2,
                 name: &name2)

// Am Schluss dürfen Sie die Ergebnisse benutzen:
kapitalAmEnde2
provision2
name2
