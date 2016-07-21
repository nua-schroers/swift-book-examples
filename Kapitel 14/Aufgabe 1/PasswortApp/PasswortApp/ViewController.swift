//
//  ViewController.swift
//  PasswortApp
//
//  Created by Dr. Wolfram Schroers on 5/20/16.
//  Copyright © 2016 Wolfram Schroers. All rights reserved.
//

import UIKit

/// Steuerung der PasswortApp.
class ViewController: UIViewController {

    /// Wird aufgerufen, wenn der Benutzer den Button antippt.
    @IBAction func benutzerDruecktErzeugen(sender: AnyObject) {
        switch self.passwortAuswahl.selectedSegmentIndex {
        case 0:
            // Das Passwort soll nur aus Ziffern bestehen.
            self.passwortGenerator.passWortTyp = .Ziffern
        case 1:
            // Das Passwort soll auch Buchstaben enthalten.
            self.passwortGenerator.passWortTyp = .Buchstaben
        default:
            // Das Passwort soll auch Sonderzeichen enthalten.
            self.passwortGenerator.passWortTyp = .Sonderzeichen
        }

        // Erzeuge das neue Passwort.
        let passwort = self.passwortGenerator.passwort()

        // Schreibe es in das Ausgabelabel.
        self.passwortLabel.text = passwort
    }

    /// Datenmodell-Klasse mit dem Passwort-Generator.
    var passwortGenerator = PasswortModell()

    /// Das Segmented Control für den Passwort-Typ.
    @IBOutlet weak var passwortAuswahl: UISegmentedControl!
    
    /// Label für die Ausgabe des Ergebnisses.
    @IBOutlet weak var passwortLabel: UILabel!
}
