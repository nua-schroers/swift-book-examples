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

    /// Anzahl der gerade angezeigten Hölzer.
    var sichtbareHoelzer: Int = 0

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

        // Aktuell sichtbare Zahl von Hölzern.
        self.sichtbareHoelzer = anzahl
    }

    /// Entferne eine bestimmte Zahl von Hölzern.
    func entferneHoelzer(anzahl: Int) {
        // Array mit allen StreichholzView-Instanzen.
        let alteHoelzer = self.subviews

        // Bestimme die Zahl der zu entfernenden Hölzer.
        // Sie darf höchstens so groß sein, wie Hölzer noch da sind.
        let entferneZahl: Int
        if anzahl > self.sichtbareHoelzer {
            entferneZahl = self.sichtbareHoelzer
        } else {
            entferneZahl = anzahl
        }

        // Drehung zur "umgefallenen" Position.
        let drehung = CGAffineTransformMakeRotation(CGFloat(M_PI/2))

        // Schleife über die Anzahl der zu entfernenden Hölzer.
        for var i=1; i<=entferneZahl; i+=1 {

            // Index des letzten Holzes, das entfernt werden soll.
            let letztes = self.sichtbareHoelzer - i

            // Die konkrete Instanz, die entfernt werden soll.
            let altesHolz = alteHoelzer[letztes]

            // Löse die Animation aus.
            UIView.animateWithDuration(1.0,
                                       animations: { () in
                                        // Setze die Transparenz am Ende auf
                                        // 0, also vollständig durchsichtig.
                                        altesHolz.alpha = 0.0

                                        // Drehe das Holz, sodass es am Ende
                                        // der Animation auf der Seite liegt.
                                        altesHolz.transform = drehung
                }, completion: { (_ : Bool) in
                    // Am Ende entferne das Holz vom
                    // Bildschirm.
                    altesHolz.removeFromSuperview()
            })
        }
        
        // Reduziere die Anzahl der sichtbaren Hölzer.
        self.sichtbareHoelzer = self.sichtbareHoelzer - anzahl
    }
}
