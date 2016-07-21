//
//  Unternehmer.swift
//  Unternehmerspiel
//
//  Created by Dr. Wolfram Schroers on 5/16/16.
//  Copyright © 2016 Wolfram Schroers. All rights reserved.
//

import Cocoa

/// Spielstand des Unternehmers.
class Unternehmer : NSObject {

    // MARK: Die Eigenschaften des Unternehmers.

    /// Der aktuelle Kontostand.
    var kontostand:Double = 0.0

    /// Die gesammelte Erfahrung.
    var erfahrung:Int = 0

    /// Das aktuelle Alter.
    var alter:Int = 21

    // MARK: Die möglichen Aktionen des Unternehmers.

    /// Der Unternehmer arbeitet ein Jahr lang.
    func arbeite() {
        // Erhöhe den Kontostand je nach der Erfahrung.
        switch self.erfahrung {

        case self.erfahrung where self.erfahrung < 1:
            // Wenn er noch unerfahren ist, so bewirkt Arbeit nur eine
            // kleine Erhöhung des Kontostandes.
            self.kontostand += 1.0

        case self.erfahrung where self.erfahrung < 3:
            // Etwas mehr Erfahrung schlägt sich in Mehreinnahmen
            // nieder.
            self.kontostand += 5.0

        default:
            // Viel Erfahrung bewirkt eine große Effizienz bei der
            // Arbeit.
            self.kontostand += 10.0
        }

        // Erhöhe das Alter in jedem Fall.
        self.alter += 1
    }

    /// Der Unternehmer verhandelt.
    func verhandle() {
        // Erhöhe die Erfahrung je nach Kontostand.
        switch self.kontostand {

        case self.kontostand where self.kontostand > 1:
            // Verhandeln kostet Geld und er kann es sich nur
            // leisten, wenn genug Geld da ist.
            self.kontostand -= 1.0
            self.erfahrung += 1

        default:
            // Ansonsten kostet Verhandeln nur Geld, sonst
            // nichts.
            self.kontostand = 0.0
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
