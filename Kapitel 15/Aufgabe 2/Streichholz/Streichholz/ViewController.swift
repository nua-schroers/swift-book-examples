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

        // Passe die Buttons an.
        self.buttonsAnpassen()
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

        // Passe die Buttons an.
        self.buttonsAnpassen()
    }

    /// Alle Buttons aktiv setzen.
    func resetButtons() {
        self.nimmEinsButton.enabled = true
        self.nimmZweiButton.enabled = true
        self.nimmDreiButton.enabled = true
    }

    /// (De–)aktiviere Buttons, wo notwendig.
    func buttonsAnpassen() {
        if self.spielHaufen.hoelzer == 2 {
            // Nur die ersten beiden Buttons sollen aktiv sein.
            self.nimmDreiButton.enabled = false
        } else {
            if self.spielHaufen.hoelzer == 1 {
                // Nur der erste Button soll aktiv sein.
                self.nimmZweiButton.enabled = false
                self.nimmDreiButton.enabled = false
            } else {
                // Alle Buttons sollen aktiv sein.
                self.resetButtons()
            }
        }
    }

    // MARK: Reaktionen der grafischen Oberfläche.

    /// Das Label für die Zahl der Streichhölzer.
    @IBOutlet weak var streichHolzAnzeige: UILabel!

    /// Das Label für die Zuganzeige.
    @IBOutlet weak var zugAnzeige: UILabel!

    /// Die drei Zugbuttons.
    @IBOutlet weak var nimmEinsButton: UIButton!
    @IBOutlet weak var nimmZweiButton: UIButton!
    @IBOutlet weak var nimmDreiButton: UIButton!

    /// Benutzer tippt einen Button.
    @IBAction func spielerTipptButton(sender: UIButton) {
        if let buttonText = sender.titleLabel?.text {
            // buttonText enthält jetzt die Beschriftung.
            // zahlText ist NUR die Zahl als String, ohne "Nimm" davor.
            let zahlText =
                buttonText.stringByReplacingOccurrencesOfString("Nimm ",
                                                                withString: "")

            // Die Zahl als Int.
            if let holzZahl = Int(zahlText) {
                // Rufe den Spielerzug mit der gewählten
                // Holzzahl auf.
                self.spielerZug(holzZahl)
            } else {
                // Die Zahl konnte nicht konvertiert werden.
            }
        }
    }
}
