//
//  DummerZug.swift
//  Streichholz
//
//  Created by Dr. Wolfram Schroers on 5/17/16.
//  Copyright © 2016 Wolfram Schroers. All rights reserved.
//

import Foundation

/// Eine dumme Strategie.
class DummerComputerZug: ComputerZug {

    /// Führe einen Zug aus und gib ihn zurück.
    override func macheZug() -> Int {
        // Führe Zug aus: genau ein Holz entfernen.
        let zug = 1

        // Führe Zug aus.
        self.haufen.entferneHoelzer(zug)

        // Gib den Wert zusätzlich zurück.
        return zug
    }
}
