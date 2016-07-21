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
        if self.passwortAuswahl.selectedSegmentIndex == 0 {
            // Das Passwort soll nur aus Ziffern bestehen.
            self.passwortGenerator.auchBuchstaben = false
        } else {
            // Das Passwort soll auch Buchstaben enthalten.
            self.passwortGenerator.auchBuchstaben = true
        }

        if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
            // Arbeite auf dem iPhone.

            // Erzeuge das neue Passwort.
            let passwort = self.passwortGenerator.passwort()

            // Schreibe es in das Ausgabelabel.
            self.passwortLabel.text = passwort
        } else {
            // Arbeite auf dem iPad.

            // Erzeuge sechs Passwörter in mehreren Zeilen
            var passwoerter = ""
            for var i=0; i<6; i+=1 {
                // Füge ein neues Passwort hinzu.
                passwoerter += self.passwortGenerator.passwort()

                // Für Zeilen 1 bis 5 füge eine neue Zeile hinzu.
                if i<5 {
                    passwoerter += "\n"
                }
            }
            
            // Schreibe die Passwärter in das Ausgabelabel.
            self.passwortLabel.text = passwoerter
        }
    }

    /// Datenmodell-Klasse mit dem Passwort-Generator.
    var passwortGenerator = PasswortModell()

    /// Das Segmented Control für den Passwort-Typ.
    @IBOutlet weak var passwortAuswahl: UISegmentedControl!
    
    /// Label für die Ausgabe des Ergebnisses.
    @IBOutlet weak var passwortLabel: UILabel!
}
