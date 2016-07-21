//
//  EinstellungenViewController.swift
//  Streichholz
//
//  Created by Dr. Wolfram Schroers on 5/17/16.
//  Copyright © 2016 Wolfram Schroers. All rights reserved.
//

import UIKit

/// Steuerungsklasse für den zweiten Bildschirm.
class EinstellungenViewController: UIViewController {

    // MARK: Eigenschaften, die von außen gesetzt werden.

    /// Die anfängliche Zahl der Hölzer.
    var anfangsHoelzer = 18

    /// Die anfängliche Strategie.
    var strategie = 0

    /// Der Delegat für die aktuellen Einstellungen.
    weak var delegate: KannEinstellungenAendern?

    // MARK: Vom Betriebssystem aufrufbar.

    /// Der Bildschirm erscheint.
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)

        // Setze den Slider auf den aktuellen Startwert.
        let startWert = Float(self.anfangsHoelzer)
        self.anfangsZahlAuswahlSlider.value = startWert

        // Setze das Label auf den aktuellen Wert.
        self.aktualisiereLabel()

        // Setze das Segmented Control auf den aktuellen Wert.
        let jetzigeStrategie = self.strategie
        self.strategieAuswahlControl.selectedSegmentIndex = jetzigeStrategie
    }

    // MARK: Eigene Methode für das Aktualisieren der Anzeige.

    /// Passe das Label auf den neuen Sliderwert an.
    func aktualisiereLabel() {
        let neuerText = "Anfangszahl der Hölzer: \(self.anfangsHoelzer)"
        self.hoelzerZahlAnzeige.text = neuerText
    }

    // MARK: Reaktionen der grafischen Oberfläche.

    /// Reaktion auf den Zurück-Button.
    @IBAction func benutzerWaehltZurueck(sender: AnyObject) {
        // Setze die geänderten Einstellungen am Delegaten.
        let jetzigeStrategie = self.strategieAuswahlControl.selectedSegmentIndex

        self.delegate?.einstellungenGeaendert(jetzigeStrategie,
                                              anfangsZahl: self.anfangsHoelzer)

        // Beende diesen Bildschirm.
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    /// Anzeige der aktuellen Anfangszahl.
    @IBOutlet weak var hoelzerZahlAnzeige: UILabel!

    /// Slider für die Anfangszahl.
    @IBOutlet weak var anfangsZahlAuswahlSlider: UISlider!

    /// Segmented Control für die Strategieauswahl.
    @IBOutlet weak var strategieAuswahlControl: UISegmentedControl!

    /// Reaktion, wenn der Benutzer den Slider bewegt.
    @IBAction func benutzerBewegtSlider(sender: AnyObject) {
        // Hole den aktuellen Wert des Sliders als Int.
        let gewaehlteZahl = Int(self.anfangsZahlAuswahlSlider.value)

        // Setze die anfangsHoelzer Eigenschaft.
        self.anfangsHoelzer = gewaehlteZahl

        // Aktualisiere das Label.
        self.aktualisiereLabel()
    }
}
