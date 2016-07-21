//
//  Angestellter.swift
//  Unternehmerspiel
//
//  Created by Dr. Wolfram Schroers on 5/17/16.
//  Copyright © 2016 Wolfram Schroers. All rights reserved.
//

import Cocoa

/// Unterklasse für einen Angestellten.
class Angestellter : Arbeiter {

    /// Der Angestellte macht Überstunden.
    func macheUeberstunden() {
        // Überstunden bewirken zweimal mehr Arbeit.
        self.arbeite()
        self.arbeite()

        // Aber sie kosten auch Nerven und laugen aus.
        self.alter += 1
    }
}
