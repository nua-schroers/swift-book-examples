//: Playground - noun: a place where people can play

import UIKit

// MARK: Kapitel 11.4.1

class Unternehmer {
    var alter:Int = 21
}
class Arbeiter : Unternehmer {}

final class AppleGruender : Unternehmer {
    // Hier kommen zusätzliche Methoden und Eigenschaften hin.
}

class NeXTGruender : Unternehmer {

    /// Diese Methode darf in Unterklassen nicht überschrieben werden.
    final func revolutioniereIndustrie() {
        // TODO Entwickle ein phantastisches neues Betriebssystem.
    }
}

class AppleRueckkehrer : NeXTGruender {

    /// Dies ist verboten:
    // override func revolutioniereIndustrie() {
    //    // TODO Erfinde ein phantastisches neues Mobiltelefon.
    //}
}

// MARK: Kapitel 11.4.2

/// Erweiterung der Klasse UILabel.
extension UILabel {
    /// Setze das Alter eines Unternehmers als Text.
    func setzeTextMitAlter(unternehmer:Unternehmer) {
        self.text = "\(unternehmer.alter)"
    }
}

// MARK: Kapitel 11.4.4

/// Erweiterung der Klasse Arbeiter.
extension Arbeiter {

    /// Gib zurück, ob die Arbeit Spaß macht.
    static func machtArbeitSpass() -> Bool {
        // Konstante Antwort: Nein!
        return false
    }
}

// Aufruf der Klassenmethode, speichert das Ergebnis in antwort.
let antwort = Arbeiter.machtArbeitSpass() // Ergebnis: antwort ist false.
