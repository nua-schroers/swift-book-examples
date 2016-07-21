//
//  ComputerStrategie.swift
//  Streichholz
//
//  Created by Dr. Wolfram Schroers on 5/17/16.
//  Copyright © 2016 Wolfram Schroers. All rights reserved.
//

import Foundation

/// Datenmodellklasse für die Strategie bei Zügen des Computers.
class ComputerStrategie {

    /// Datenmodell für Suche des Computer-Zuges.
    var computerZugSuche: ComputerZug

    /// Datenmodell des Holzhaufens.
    var spielHaufen: HolzHaufen

    /// Wähle den Typ der Stragie.
    var strategieTyp = 0 {
        willSet(neueStrategie) {
            switch neueStrategie {
            case 0:
                // Benutze die "dumme" Strategie.
                self.computerZugSuche = DummerComputerZug(meinHaufen: self.spielHaufen)
            case 1:
                // Benutze die "wilde" Strategie.
                self.computerZugSuche = ComputerZug(meinHaufen: self.spielHaufen)
            default:
                // Benutze die "schlaue" Strategie.
                self.computerZugSuche = KlugerComputerZug(meinHaufen: self.spielHaufen)
            }
        }
    }

    /// Führe einen Zug aus und gib ihn zurück.
    func macheZug() -> Int {
        return self.computerZugSuche.macheZug()
    }

    /// Initialisiere diese Klasse.
    init(haufen: HolzHaufen) {
        // Merke den Holzhaufen (für Änderungen von strategieTyp).
        self.spielHaufen = haufen
        
        // Erzeuge die Anfangsstrategie.
        self.computerZugSuche = DummerComputerZug(meinHaufen: haufen)
    }
}
