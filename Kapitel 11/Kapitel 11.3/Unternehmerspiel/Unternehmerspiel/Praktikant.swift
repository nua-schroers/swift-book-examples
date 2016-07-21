//
//  Praktikant.swift
//  Unternehmerspiel
//
//  Created by Dr. Wolfram Schroers on 5/17/16.
//  Copyright © 2016 Wolfram Schroers. All rights reserved.
//

import Cocoa

class Praktikant: Angestellter, KannStudieren {
    override func arbeite() {
        // Diese Implementierung von arbeite funktioniert anders als die in
        // der Basisklasse: Sie erhöht erfahrung statt kontostand!
        self.erfahrung += 1
        self.alter += 1
    }

    func studiere() {
        self.erfahrung += 2
        self.alter += 1
    }
}
