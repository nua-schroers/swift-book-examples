//
//  ViewController.swift
//  HalloWelt
//
//  Created by Dr. Wolfram Schroers on 5/16/16.
//  Copyright © 2016 Wolfram Schroers. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /// Wird aufgerufen, wenn der "Drück mich!" Button angetippt wurde.
    @IBAction func benutzerDruecktButton(sender: AnyObject) {
        // Kontrollausgabe, wenn diese Methode aufgerufen wird.
        print("Der Button wurde betätigt!")

        // Ändere den Titel des Buttons.
        // Sowohl wenn er aktiv ist, als auch wenn er nicht aktiv ist.
        self.knopf.setTitle("Das reicht!", forState: UIControlState.Normal)
        self.knopf.setTitle("GENUG!", forState: UIControlState.Disabled)

        // Deaktivere den Button.
        self.knopf.enabled = false
    }

    /// Wird aufgerufen, wenn der Benutzer den Slider betätigt.
    @IBAction func benutzerBewegtSlider(sender: AnyObject) {
        // Konstante mit dem Slider.
        let slider:UISlider = sender as! UISlider

        // Kontrollausgabe des aktuellen Wertes.
        print("Wert des Reglers: \(slider.value)")
    }

    /// Wird aufgerufen, wenn der "Zurück!" Button angetippt wurde.
    @IBAction func benutzerDruecktZurueck(sender: AnyObject) {
        // Setze den Slider auf seinen min-Wert.
        self.schiebeRegler.value = self.schiebeRegler.minimumValue
    }

    /// Wird aufgerufen, wenn der "-" Button angetippt wurde.
    @IBAction func benutzerDruecktMinus(sender: AnyObject) {
        // Ein Zehntel des gesamten Schieberegler-Bereichs.
        let distanz = 0.1 * (self.schiebeRegler.maximumValue - self.schiebeRegler.minimumValue)

        // Bewege den Schieberegler auf den neuen Wert, aber nicht weiter als bis zum Minimum.
        let neuerWert = max(self.schiebeRegler.minimumValue, self.schiebeRegler.value - distanz)
        self.schiebeRegler.value = neuerWert
    }

    /// Wird aufgerufen, wenn der "+" Button angetippt wurde.
    @IBAction func benutzerDruecktPlus(sender: AnyObject) {
        // Ein Zehntel des gesamten Schieberegler-Bereichs.
        let distanz = 0.1 * (self.schiebeRegler.maximumValue - self.schiebeRegler.minimumValue)

        // Bewege den Schieberegler auf den neuen Wert, aber nicht weiter als bis zum Maximum.
        let neuerWert = min(self.schiebeRegler.maximumValue, self.schiebeRegler.value + distanz)
        self.schiebeRegler.value = neuerWert
    }

    @IBOutlet weak var knopf: UIButton!
    @IBOutlet weak var schiebeRegler: UISlider!
}

