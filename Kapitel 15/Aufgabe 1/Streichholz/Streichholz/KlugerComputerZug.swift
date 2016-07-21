//
//  KlugerComputerZug.swift
//  Streichholz
//
//  Created by Dr. Wolfram Schroers on 5/17/16.
//  Copyright © 2016 Wolfram Schroers. All rights reserved.
//

import Foundation

/// Eine schlaue Strategie.
class KlugerComputerZug: ComputerZug {

    /// Führe einen Zug aus und gib ihn zurück.
    override func macheZug() -> Int {
        // Finde die nächste "verbotene Zahl".
        let verboteneZahl = ((self.haufen.hoelzer-1)/4)*4+1

        // Finde die Differenz zur aktuellen Zahl der Hölzer.
        let differenz = self.haufen.hoelzer - verboteneZahl

        // Bestimme damit den Zug.
        var zug: Int
        if differenz > 0 {
            // Zwinge den Gegner auf eine "verbotene Zahl".
            zug = differenz
        } else {
            // Falls selbst auf einer "verbotenen Zahl":
            // Nimm nur ein Holz weg.
            zug = 1
        }

        // Führe Zug aus.
        self.haufen.entferneHoelzer(zug)
        
        // Gib den Wert zusätzlich zurück.
        return zug
    }
}
