//
//  Arbeiter.swift
//  Unternehmerspiel
//
//  Created by Dr. Wolfram Schroers on 5/17/16.
//  Copyright © 2016 Wolfram Schroers. All rights reserved.
//

import Cocoa

/// Gemeinsame Basisklasse für alle Mitarbeiter.
class Arbeiter : NSObject {
    // Die Eigenschaften des Arbeiters.

    /// Der aktuelle Kontostand.
    var kontostand:Double = 0.0

    /// Die gesammelte Erfahrung.
    var erfahrung:Int = 0

    /// Das aktuelle Alter.
    var alter:Int = 21

    // Die möglichen Aktionen des Arbeiters.

    /// Arbeite ein Jahr lang.
    func arbeite() {
        // Erhöhe den Kontostand je nach der Erfahrung.
        switch self.erfahrung {

        case self.erfahrung where self.erfahrung < 1:
            self.kontostand += 1.0

        case self.erfahrung where self.erfahrung < 3:
            self.kontostand += 5.0

        default:
            self.kontostand += 10.0
        }

        // Erhöhe das Alter in jedem Fall.
        self.alter += 1
    }

    /// Gib den aktuellen Stand am Bildschirm aus.
    func aktuellerStand() {
        print("Konto: \(self.kontostand), Erfahrung: " +
            "\(self.erfahrung), Alter: \(self.alter).")
    }
}
