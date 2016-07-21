//
//  main.swift
//  FizzBuzzMemo
//
//  Created by Dr. Wolfram Schroers on 5/17/16.
//  Copyright © 2016 Wolfram Schroers. All rights reserved.
//

import Foundation

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

/// Lade ein existierendes FizzBuzz–Array aus der Datei
/// "FizzBuzzDaten.dat" oder erzeuge es neu und speichere es ab.
func holeFizzBuzzArray() -> Array<String> {
    // Der Name der Datei.
    let fizzBuzzDatei = "FizzBuzzDaten.dat"

    // Hole das "Dokumente" Verzeichnis.
    let dokumentenVerzeichnis = NSSearchPathForDirectoriesInDomains(
        NSSearchPathDirectory.DocumentDirectory,
        NSSearchPathDomainMask.UserDomainMask,
        true).last!

    // Der vollständige Name mit Verzeichnispfad und Datei.
    let vollerName = dokumentenVerzeichnis + "/" + fizzBuzzDatei

    // Prüfe, ob die Datei existiert.
    let derDateiManager = NSFileManager.defaultManager()
    let dateiExistiert = derDateiManager.fileExistsAtPath(vollerName)

    // Definiere das Ergebnis–Array, zunächst ist es leer.
    var fizzBuzzArray = Array<String>()

    if (dateiExistiert) {
        // Lade die Datei.
        // Achtung: Keine Fehlerbehandlung!
        fizzBuzzArray = NSArray(contentsOfFile:vollerName) as! Array<String>
    } else {
        // Berechne das Array neu.
        fizzBuzzArray = erzeugeFizzBuzzArray()

        // Speichere es ab.
        let cocoaArray:NSArray = fizzBuzzArray
        cocoaArray.writeToFile(vollerName, atomically:true)
    }

    // Gib das Ergebnis zurück.
    return fizzBuzzArray
}

// Gib alle Zeilen, die erzeugeFizzBuzzArray liefert, aus.
for zeile in holeFizzBuzzArray() {
    print("\(zeile)")
}
