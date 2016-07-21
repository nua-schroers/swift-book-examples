//: Playground - noun: a place where people can play

import UIKit

// MARK: Aufgabe 1

func summe(zahlen:Array<Int>) -> Int {
    // Diese Variable akkumuliert die einzelnen Einträge.
    var ergebnis = 0

    // Die Schleife addiert alle Zahlen einzeln.
    for zahl in zahlen {
        ergebnis += zahl
    }

    // Gib das Ergebnis zurück.
    return ergebnis
}

// Gib das Ergebnis zurück. return ergebnis
let ergebnis = summe([30, 4, 67]) // Liefert 101

// MARK: Aufgabe 2

func schnittArray(array1:Array<Int>, _ array2:Array<Int>) -> Array<Int> {
    // Das Ergebnis wird in einem Array gespeichert, das
    // veränderlich und anfangs noch leer ist.
    var ergebnis = Array<Int>()

    // Diese Schleife läuft über alle Einträge des ersten Arrays.
    for zahl1 in array1 {

        // Diese Schleife läuft über alle Einträge des zweiten Arrays.
        for zahl2 in array2 {
            if zahl1 == zahl2 {
                // Gemeinsamer Eintrag gefunden!
                // Füge ihn zur Schnittmenge hinzu und brich dann
                // die innere Schleife ab.
                ergebnis.append(zahl1)
                break
            }
        }
    }

    // Gib das Ergebnis zurück.
    return ergebnis
}

let array1 = [1, 2, 3, 4, 5]
let array2 = [2, 4, 6]
let derSchnitt = schnittArray(array1, array2) // Liefert [2, 4]

// MARK: Aufgabe 3

var inhalt2 = [3, "Hallo", 5, "World"]

// Das Ergebnis, ein Array aus allen geladenen Int–Zahlen.
var sammler = Array<Int>()

// Schleife über alle geladenen Elemente.
for element in inhalt2 {
    // Füge alle Int–Zahlen zum Ergebnis hinzu, verwirf alle anderen.
    if let elementInt = element as? Int {
        sammler.append(elementInt)
    }
}

sammler // Liefert [3, 5]

// MARK: Aufgabe 4

// Funktionen, die entweder eine Zahl als String oder "Fizz",
// "Buzz" oder "FizzBuzz" liefern.
let zahlFunktion:(Int) -> String = { x in return String(x) }
let fizzFunktion:(Int) -> String = { _ in return "Fizz" }
let buzzFunktion:(Int) -> String = { _ in return "Buzz" }
let fizzBuzzFunktion:(Int) -> String = { _ in return fizzFunktion(0) + buzzFunktion(0) }

// Tabelle von Funktionen, die eine Zahl bekommen und einen
// String liefern.
let fizzBuzzFunktionen = [
    fizzBuzzFunktion,
    zahlFunktion,
    zahlFunktion,
    fizzFunktion,
    zahlFunktion,
    buzzFunktion,
    fizzFunktion,
    zahlFunktion,
    zahlFunktion,
    fizzFunktion,
    buzzFunktion,
    zahlFunktion,
    fizzFunktion,
    zahlFunktion,
    zahlFunktion]

// Gesuchte FizzBuzz–Funktion: Sie benutzt die jeweils
// geeignete Funktion aus der Liste fizzBuzzFunktionen
// und führt sie aus.
func fizzBuzzOptimal(x:Int) -> String {
    return fizzBuzzFunktionen[x % 15](x)
}

// Probeausgabe
for x in 1...100 {
    print(fizzBuzzOptimal(x))
}

// MARK: Aufgabe 5

// Liefere ein einfaches Array zurück, egal was übergeben wurde.
func flachMacher(element:AnyObject?) -> Array<AnyObject> {
    if let einArray = element as? Array<AnyObject> {
        // Fallunterscheidung: Das Element ist ein Array.
        var sammler = Array<AnyObject>()

        // Durchlaufe das Array.
        for unterElement in einArray {
            // Mache das Unterelement zu einem flachen Array.
            let flachesUnterArray = flachMacher(unterElement)

            // Füge alle Elemente hinzu.
            for einElement in flachesUnterArray {
                sammler.append(einElement)
            }
        }

        // Gib das flache Array aller Unterelemente zurück.
        return sammler
    } else if element != nil {
        // Fallunterscheidung: Ist das Element nicht nil?
        return [element!]
    } else {
        // Das Element ist nil.
        return Array<AnyObject>()
    }
}

flachMacher([5, [3, 4], [2, [1]]]) // Liefert [5, 3, 4, 2, 1]

// MARK: Aufgabe 6

// Alle Zahlen kleiner 1000.
let alleZahlen = Range<Int>(start: 1, end: 1000)

// Alle Zahlen kleiner 1000, die durch 3 oder 5 teilbar sind.
let teilbar = alleZahlen.filter { x in return x % 3 == 0 || x % 5 == 0 }

// Summe aller teilbaren Zahlen.
let euler1 = teilbar.reduce(0) { eintrag, summe in return summe + eintrag }

// Das Ergebnis.
euler1

