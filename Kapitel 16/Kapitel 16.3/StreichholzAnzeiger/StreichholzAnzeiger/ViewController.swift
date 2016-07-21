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

        // Bestimme Position und Größe des Haufens.
        let haufenPosition = CGRectMake(10, 10, 300, 240)

        // Erzeuge das WSHaufenView-Objekt.
        let haufen = HaufenView(frame: haufenPosition)

        // Füge es zum Bildschirm hinzu.
        self.view.addSubview(haufen)

        // Setze die Zahl der Streichhölzer auf 24.
        haufen.setzeHoelzer(24)
    }
    
}
