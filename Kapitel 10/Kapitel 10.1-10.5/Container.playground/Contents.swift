//: Playground - noun: a place where people can play

import UIKit

// MARK: Abschnitt 10.1

// Definiere ein Array, greife auf die Einträge zu
let zahlen = [3, 5, 2, 1]
let eineZahl = zahlen[1]
let letzteZahl = zahlen.last

for zahl in zahlen {
    // zahl können Sie nun als Konstante benutzen.
    print("Eintrag: \(zahl)")
}

for var meinIndex=1; meinIndex<zahlen.count; meinIndex += 1 {
    // meinIndex ist eine normale Int–Variable.
    print("Eintrag: \(zahlen[meinIndex])")
}

// Kopiere das Array in eine Variable und verändere es
var meineZahlen = zahlen
meineZahlen.append(4)
zahlen

// Fließkommazahlen
let fliessZahlen = [3.0, 5, 2, 1]
let fliessZahlen2:Array<Double> = [3, 5, 2, 1]
fliessZahlen == fliessZahlen2

// Entfernen und Ersetzen von Elementen
meineZahlen.removeAtIndex(1)
meineZahlen[0] = 101
meineZahlen

// MARK: Abschnitt 10.2

/// Berechne das FizzBuzz–Array für 100 Einträge neu und gib es
/// zurück.
func erzeugeFizzBuzzArray() -> Array<String> {
    // Das anfängliche leere Array.
    var alleEintraege = Array<String>()

    // Zunächst wird das Array nur mit den Zeilennummern befüllt.
    for var wert=1; wert<=100; wert+=1 {
        alleEintraege.append("\(wert)")
    }

    // Dann wird jede dritte Zeile durch "Fizz" ersetzt.
    for var wert=1; wert<=100/3; wert+=1 {
        alleEintraege[wert*3-1] = "Fizz"
    }

    // Im nächsten Schritt wird jede fünfte Zeile durch "Buzz" ersetzt.
    for var wert=1; wert<=100/5; wert+=1 {
        alleEintraege[wert*5-1] = "Buzz"
    }

    // Schließlich wird jede fünfzehnte Zeile durch "FizzBuzz" ersetzt.
    for var wert=1; wert<=100/15; wert+=1 {
        alleEintraege[wert*15-1] = "FizzBuzz"
    }

    // Gib das gesamte Array zurück.
    return alleEintraege
}

// Gib alle Zeilen, die erzeugeFizzBuzzArray liefert, aus.
for zeile in erzeugeFizzBuzzArray() {
    print("\(zeile)")
}

// MARK: Abschnitt 10.3

// Ein Dictionary erzeugen
var schulNoten = ["Sehr gut" : 1, "Gut" : 2,
                  "Befriedigend" : 3, "Ausreichend" : 4]
let sehrGut = schulNoten["Sehr gut"]

// Erzeugt einen neuen Eintrag.
schulNoten["Mangelhaft"] = 55

// Ändert den gerade hinzugefügten Eintrag.
schulNoten["Mangelhaft"] = 5

// Alternative Schreibweisen
var meineNoten:Dictionary<String, Int> = schulNoten
var meineNotenAlt:[String: Int] = schulNoten

// Abfragen/Benutzung

// Gib alle Schlüssel in schulNoten aus.
for schluessel in schulNoten.keys {
    print("\(schluessel)")
}

// Gib alle Werte in schulNoten aus.
for wert in schulNoten.values {
    print("\(wert)")
}

// Gib alle Schlüssel/Werte Paare in schulNoten aus.
for (schluessel, wert) in schulNoten {
    print("\(schluessel) entspricht als Zahl \(wert)")
}

// MARK: Abschnitt 10.4

var kannAllesSpeichern:Array<AnyObject> = []

// Speichere Zahlen ab.
kannAllesSpeichern.append(101)
kannAllesSpeichern.append(3.14159)

// Speichere einen Bool ab.
kannAllesSpeichern.append(true)

// Speichere einen String ab.
kannAllesSpeichern.append("Haha!")

// Speichere ein Unternehmer–Objekt ab.
class Unternehmer {}
kannAllesSpeichern.append(Unternehmer())

// Am Ende füge noch einen weiteren String hinzu.
kannAllesSpeichern.append("Viel Spaß!")

// Schleife über das gesamte Array.
for eintrag in kannAllesSpeichern {
    // Gib alle Einträge, die Strings sind, aus.
    if let zeichenkette = eintrag as? String {
        print("Ein String: \(zeichenkette)")
    }
}

// Direkter Zugriff auf Elemente
let textHaha = kannAllesSpeichern[3] as! String

// Direkter Zugriff auf bekannten Datentyp
var meineZahl = 101 as Double

// MARK: Abschnitt 10.5

// Hole das "Dokumente" Verzeichnis.
let dokumentenVerzeichnis = NSSearchPathForDirectoriesInDomains(
    NSSearchPathDirectory.DocumentDirectory,
    NSSearchPathDomainMask.UserDomainMask,
    true).last!

// Der Name der Datei.
let dateiName = "MeineDaten.dat"

// Der vollständige Name mit Verzeichnispfad und Datei.
let vollerName = dokumentenVerzeichnis + "/" + dateiName

// Ein Array speichern
let cocoaArray:NSArray = [1, 2, 3]
cocoaArray.writeToFile(vollerName, atomically:true)

// Und wieder laden
var geladen = NSArray(contentsOfFile:vollerName) as! Array<Int>
cocoaArray == geladen

