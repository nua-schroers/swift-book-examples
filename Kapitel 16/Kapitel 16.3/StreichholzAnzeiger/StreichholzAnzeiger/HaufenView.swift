//
//  HaufenView.swift
//  StreichholzAnzeiger
//
//  Created by Dr. Wolfram Schroers on 5/17/16.
//  Copyright © 2016 Wolfram Schroers. All rights reserved.
//

import UIKit

/// Anzeige einer Sammlung von Streichhölzern.
class HaufenView: UIView {

    /// Wird benutzt, um ein UIView im Programmtext zu erzeugen.
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }

    /// Wird benutzt, um ein UIView von einem Storyboard aus zu
    /// erzeugen.
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }

    /// Konfiguriere dieses View.
    func setup() {
        // Setze den eigenen Hintergrund auf
        // "durchsichtig" ("clearColor").
        self.backgroundColor = UIColor.clearColor()
    }

    /// Setze eine feste Anzahl von Hölzern.
    func setzeHoelzer(anzahl: Int) {
        // Entferne alle alten Hölzer.
        let alteHoelzer = self.subviews
        for holz in alteHoelzer {
            holz.removeFromSuperview()
        }

        // Bestimme die Zahl der notwendigen Zeilen.
        let zeilen = anzahl / 10

        // Bestimme die Zahl der Hölzer in der letzten Zeile.
        let anzahlLetzteZeile = anzahl - (zeilen * 10)

        // Zeichne alle vollen Zeilen.
        for var zeile=0; zeile<zeilen; zeile+=1 {
            for var spalte=0; spalte<10; spalte+=1 {
                // Bestimmte die Position eines Streichholzes
                // aus Zeile und Spalte.
                let position = CGRectMake(CGFloat(10+spalte*30),
                                          CGFloat(0+zeile*80),
                                          30, 80)

                // Erzeuge ein neues StreichholzView an der
                // gewünschten Position.
                let streichholz = StreichholzView(frame: position)
                
                // Füge es hinzu.
                self.addSubview(streichholz)
            }
        }

        // Zeichne die letzte Zeile.
        for var spalte=0; spalte<anzahlLetzteZeile; spalte+=1 {
            // Bestimme die Position eines Streichholzes der
            // letzten Zeile.
            let position = CGRectMake(CGFloat(10+spalte*30),
                                      CGFloat(0+zeilen*80),
                                      30, 80)

            // Erzeuge ein neues WSStreichholzView an der
            // gewünschten Position.
            let streichholz = StreichholzView(frame: position)

            // Füge es hinzu.
            self.addSubview(streichholz)
        }
    }

    /// Entferne eine bestimmte Zahl von Hölzern.
    func entferneHoelzer(anzahl: Int) {
        // Entferne eine bestimmte Zahl von Hölzern.
        for var i=0; i<anzahl; i+=1 {
            // Entferne das letzte Holz (wenn es existiert).
            self.subviews.last?.removeFromSuperview()
        }
    }
}
