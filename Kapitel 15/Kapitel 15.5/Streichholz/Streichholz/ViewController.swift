//
//  ViewController.swift
//  Streichholz
//
//  Created by Dr. Wolfram Schroers on 5/17/16.
//  Copyright © 2016 Wolfram Schroers. All rights reserved.
//

import UIKit

/// Konfigurierbarkeit des Datenmodells.
protocol KannEinstellungenAendern: class {

    /// Übernehme aktuelle Einstellungen.
    func einstellungenGeaendert(strategieTyp: Int,
                                anfangsZahl: Int)
}

/// Die Steuerung des ersten Bildschirms.
class ViewController: UIViewController, KannEinstellungenAendern {

    // MARK: Eigenschaften für das Datenmodell.

    /// Datenmodell für den Spielstand.
    var spielHaufen: HolzHaufen

    /// Datenmodell für die Computerzüge.
    var computerStrategie: ComputerStrategie

    // MARK: Vom Betriebssystem aufrufbar.

    /// Initialisiere diese Klasse.
    required init?(coder aDecoder: NSCoder) {
        // Erzeuge alle Datenmodellklassen.
        self.spielHaufen = HolzHaufen()
        self.computerStrategie = ComputerStrategie(haufen: self.spielHaufen)

        // Rufe die Basisklasse auf.
        super.init(coder: aDecoder)
    }

    /// Der Bildschirm erscheint.
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)

        // Starte eine neues Spiel.
        self.neuesSpiel()
    }

    /// Der zweite Bildschirm wird erscheinen.
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Wird nur bei "zuEinstellungen" ausgeführt.
        if segue.identifier == "zuEinstellungen" {
            // Setze den controller als assoziierten EinstellungenViewController.
            let controller = segue.destinationViewController as!
            EinstellungenViewController

            // Setze die Eigenschaften des EinstellungenViewController.
            controller.anfangsHoelzer = self.spielHaufen.anfangsZahl
            controller.strategie = self.computerStrategie.strategieTyp
            controller.delegate = self
        }
    }

    // MARK: KannEinstellungenAendern

    func einstellungenGeaendert(strategieTyp: Int,
                                anfangsZahl: Int) {
        self.computerStrategie.strategieTyp = strategieTyp
        self.spielHaufen.anfangsZahl = anfangsZahl
    }

    // MARK: Eigene Methoden für den Spielablauf.

    /// Starte ein neues Spiel.
    func neuesSpiel() {
        // Setze die anfängliche Zahl der Hölzer.
        self.spielHaufen.hoelzer = self.spielHaufen.anfangsZahl

        // Anfängliche Spielanweisung.
        self.zugAnzeige.text = "Machen Sie einen Zug"

        // Gib den Spielstand aus.
        self.zeigeSpielstand()
    }

    /// Gib den aktuellen Spielstand aus.
    func zeigeSpielstand() {
        self.streichHolzAnzeige.text = "Hölzer: \(self.spielHaufen.hoelzer)"
    }

    /// Beende das Spiel.
    func spielEnde(nachricht: String) {
        // Erzeuge ein Alertview mit der nachricht.
        let anzeige = UIAlertController(title: "Das Spiel ist aus",
                                        message: nachricht,
                                        preferredStyle: .Alert)

        // Füge einen Button mit Aktion hinzu.
        let buttonAktion = UIAlertAction(title: "Neues Spiel",
                                         style: .Default) { (action) -> Void in
                                            // Beginne ein neues Spiel.
                                            self.neuesSpiel()
        }
        anzeige.addAction(buttonAktion)
        
        // Zeige das Alertview an.
        self.presentViewController(anzeige,
                                   animated: true,
                                   completion: nil)
    }

    /// Benutzer macht einen Spielerzug.
    func spielerZug(zahl: Int) {
        // Führe den Spielerzug aus.
        self.spielHaufen.entferneHoelzer(zahl)

        // Prüfe, ob der Spieler verloren hat.
        if self.spielHaufen.istVerloren() {
            // Der Spieler hat verloren.
            self.spielEnde("Sie haben verloren!")
        } else {
            // Mache einen Computerzug.
            let computerZahl = self.computerStrategie.macheZug()

            // Prüfe, ob der Computer verloren hat.
            if self.spielHaufen.istVerloren() {
                // Der Computer hat verloren.
                self.spielEnde("Ich habe verloren!")
            } else {
                // Gib den Computerzug aus.
                self.zugAnzeige.text = "Ich nehme \(computerZahl) Hölzer"
            }
        }

        // Gib den Spielstand aus.
        self.zeigeSpielstand()
    }

    // MARK: Reaktionen der grafischen Oberfläche.

    /// Das Label für die Zahl der Streichhölzer.
    @IBOutlet weak var streichHolzAnzeige: UILabel!

    /// Das Label für die Zuganzeige.
    @IBOutlet weak var zugAnzeige: UILabel!

    /// Benutzer tippt den Button "Nimm 1".
    @IBAction func nimmEins(sender: AnyObject) {
        self.spielerZug(1)
    }

    /// Benutzer tippt den Button "Nimm 2".
    @IBAction func nimmZwei(sender: AnyObject) {
        self.spielerZug(2)
    }
    
    /// Benutzer tippt den Button "Nimm 3".
    @IBAction func nimmDrei(sender: AnyObject) {
        self.spielerZug(3)
    }
}
