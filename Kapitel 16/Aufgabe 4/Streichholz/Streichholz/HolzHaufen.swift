//
//  HolzHaufen.swift
//  Streichholz
//
//  Created by Dr. Wolfram Schroers on 5/17/16.
//  Copyright © 2016 Wolfram Schroers. All rights reserved.
//

import Foundation

/// Repräsentiert einen Holzhaufen. Er speichert die  Zahl der
/// Hölzer und bietet die Funktionalität, den Spielstand
/// auszuwerten.
class HolzHaufen {

    /// Die Anfangszahl der Hölzer.
    var anfangsZahl = 18

    /// Die aktuelle Zahl der Hölzer.
    var hoelzer = 18

    /// Zahl der Hölzer, die pro Zug entfernt werden dürfen.
    var nimmMaximum = 3

    /// Entferne eine bestimmte Zahl von Hölzern.
    func entferneHoelzer(zahl: Int) {
        if self.hoelzer > zahl {
            // Es gibt genug Hölzer, entferne die gewünschte Zahl.
            self.hoelzer -= zahl
        } else {
            // Entferne alle Hölzer.
            self.hoelzer = 0
        }
    }

    /// Maximale Zahl der Hölzer, die ein Spieler nehmen kann.
    func grenze() -> Int {
        if self.hoelzer < nimmMaximum {
            // Ein Spieler darf maximal alle Hölzer nehmen, die es gibt.
            return self.hoelzer
        } else {
            // Ein Spieler darf bis zu nimmMaximum Hölzer nehmen.
            return nimmMaximum
        }
    }
    
    /// Bestimme, ob das Spiel verloren ist.
    func istVerloren() -> Bool {
        return (self.hoelzer == 0)
    }
}
