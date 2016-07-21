//
//  AppDelegate.swift
//  PasswortMac
//
//  Created by Dr. Wolfram Schroers on 5/23/16.
//  Copyright © 2016 Wolfram Schroers. All rights reserved.
//

import Cocoa

/// Hauptsteuerungsklasse der PasswortMac-Anwendung.
@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    /// Das Hauptfenster der App.
    @IBOutlet weak var window: NSWindow!

    /// Datenmodell-Klasse mit dem Passwort-Generator.
    var passwortGenerator = PasswortModell()

    /// Das Segmented Control für den Passwort-Typ.
    @IBOutlet weak var passwortAuswahl: NSSegmentedControl!

    /// Label für die Ausgabe des Ergebnisses.
    @IBOutlet weak var passwortLabel: NSTextField!

    /// Reaktion, wenn der Benutzer den Button klickt.
    @IBAction func benutzerDruecktErzeugen(sender: AnyObject) {
        if self.passwortAuswahl.selectedSegment == 0 {
            // Das Passwort soll nur aus Ziffern bestehen.
            self.passwortGenerator.auchBuchstaben = false
        } else {
            // Das Passwort soll auch Buchstaben enthalten.
            self.passwortGenerator.auchBuchstaben = true
        }

        // Erzeuge das neue Passwort.
        let passwort = self.passwortGenerator.passwort()

        // Schreibe es in das Ausgabelabel.
        self.passwortLabel.stringValue = passwort
    }
}
