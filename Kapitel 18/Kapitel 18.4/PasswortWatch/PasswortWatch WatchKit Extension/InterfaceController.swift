//
//  InterfaceController.swift
//  PasswortWatch WatchKit Extension
//
//  Created by Dr. Wolfram Schroers on 5/23/16.
//  Copyright © 2016 Wolfram Schroers. All rights reserved.
//

import WatchKit
import Foundation

/// Steuerungsklasse für Passwörter auf der Apple Watch.
class InterfaceController: WKInterfaceController {

    /// Datenmodell-Klasse mit dem Passwort-Generator.
    var passwortGenerator = PasswortModell()

    /// Wird vor dem Anzeigen der App aufgerufen.
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        neuesPasswort()
    }

    /// Das Label für die Ausgabe des Passworts.
    @IBOutlet var passwortLabel: WKInterfaceLabel!

    /// Reaktion auf den Button "Buchstaben".
    @IBAction func benutzerTippBuchstaben() {
        self.passwortGenerator.auchBuchstaben = true
        neuesPasswort()
    }

    /// Reaktion auf den Button "Ziffern".
    @IBAction func benutzerTipptZiffern() {
        self.passwortGenerator.auchBuchstaben = false
        neuesPasswort()
    }

    /// Erzeuge ein neues Passwort und zeige es an.
    func neuesPasswort() {
        let passwort = self.passwortGenerator.passwort()
        self.passwortLabel.setText(passwort)
    }
}
