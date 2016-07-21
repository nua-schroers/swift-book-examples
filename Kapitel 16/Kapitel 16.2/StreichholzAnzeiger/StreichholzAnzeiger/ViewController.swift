//
//  ViewController.swift
//  StreichholzAnzeiger
//
//  Created by Dr. Wolfram Schroers on 5/17/16.
//  Copyright © 2016 Wolfram Schroers. All rights reserved.
//

import UIKit

/// Hauptbildschirm zum Testen der StreichholzAnzeige.
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Definiere den Bereich, in dem das Streichholz angezeigt werden
        // soll.
        let streichholzBereich = CGRectMake(20, 20, 50, 100)

        // Erzeuge ein StreichholzView.
        let anzeige = StreichholzViewAlt(frame: streichholzBereich)

        // Füge es zum Bildschirm hinzu.
        self.view.addSubview(anzeige)
    }
    
}
