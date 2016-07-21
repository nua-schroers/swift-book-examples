//
//  ComputerZug.swift
//  Streichholz
//
//  Created by Dr. Wolfram Schroers on 5/17/16.
//  Copyright © 2016 Wolfram Schroers. All rights reserved.
//

import Foundation

/// Liefere einen Computerzug.
class ComputerZug {

    /// Der Holzhaufen, auf dem gespielt wird.
    var haufen: HolzHaufen

    /// Konfiguriere die Klasse.
    init(meinHaufen: HolzHaufen) {
        self.haufen = meinHaufen
    }

    /// Führe einen Zug aus und gib ihn zurück.
    func macheZug() -> Int {
        // Die maximale Zahl an Hölzern, die der Computer nehmen darf.
        let nimmHoechstens = self.haufen.grenze()

        // Bestimme den Zug.
        // Der Zug ist eine Zufallszahl zwischen 1 und nimmHoechstens.
        let zug = zufallsZahl(oben:nimmHoechstens)

        // Führe Zug aus.
        self.haufen.entferneHoelzer(zug)
        
        // Gib den Wert zusätzlich zurück.
        return zug
    }
}

/// Liefere eine Zufallszahl zwischen unten und oben (beide
/// einschließlich).
func zufallsZahl(unten:Int = 1, oben:Int = 3) -> Int {
    // Liefere eine Zufallszahl zwischen oben und unten.
    let zufall = arc4random_uniform(UInt32(oben - unten + 1))
    let ergebnis = unten + Int(zufall)

    // Gib sie zurück.
    return ergebnis
}
