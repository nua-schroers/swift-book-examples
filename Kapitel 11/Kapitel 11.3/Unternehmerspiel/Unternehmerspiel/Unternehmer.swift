//
//  Unternehmer.swift
//  Unternehmerspiel
//
//  Created by Dr. Wolfram Schroers on 5/16/16.
//  Copyright © 2016 Wolfram Schroers. All rights reserved.
//

import Cocoa

/// Unterklasse für den Unternehmer.
class Unternehmer : Arbeiter, KannStudieren {

    // Methoden, die ein Unternehmer zusätzlich zu allen Methoden des
    // Arbeiter beherrscht.

    /// Der Unternehmer verhandelt.
    func verhandle() {
        // Erhöhe die Erfahrung je nach Kontostand.
        switch self.kontostand {

        case self.kontostand where self.kontostand > 1:
            self.kontostand -= 1.0
            self.erfahrung += 1

        default:
            self.kontostand = 0.0
        }

        // Erhöhe das Alter in jedem Fall.
        self.alter += 1
    }

    /// Sammle Erfahrung, ohne zu verhandeln.
    func studiere() {
        // Ein Beispiel, wie das vor sich gehen könnte:
        // Erhöhe die Erfahrung sehr deutlich um 2.
        self.erfahrung += 2

        // Das Alter erhöht sich wie gewohnt um 1.
        self.alter += 1
    }
}
