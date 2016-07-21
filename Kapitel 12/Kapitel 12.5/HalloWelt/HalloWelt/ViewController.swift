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

    /// Wird aufgerufen, wenn der Button angetippt wurde.
    @IBAction func benutzerDruecktButton(sender: AnyObject) {
        // Kontrollausgabe, wenn diese Methode aufgerufen wird.
        print("Der Button wurde betätigt!")

        // Ändere den Titel des Buttons.
        // Sowohl wenn er aktiv ist, als auch wenn er nicht aktiv ist.
        // Texte für aktiven und inaktiven Button.
        let aktiverText = NSLocalizedString("Enough", comment:"")
        let nichtAktiverText = NSLocalizedString("REALLY!",
                                                 comment:"")

        // Setzen der Texte.
        self.knopf.setTitle(aktiverText, forState: UIControlState.Normal)
        self.knopf.setTitle(nichtAktiverText, forState: UIControlState.Disabled)

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

    @IBOutlet weak var knopf: UIButton!
}

