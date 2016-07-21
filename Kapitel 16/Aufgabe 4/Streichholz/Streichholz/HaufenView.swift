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

        // Schleife über die Anzahl der zu entfernenden Hölzer.
        for var i=1; i<=entferneZahl; i+=1 {

            // Index des letzten Holzes, das entfernt werden soll.
            let letztes = self.sichtbareHoelzer - i

            // Die konkrete Instanz, die entfernt werden soll.
            let altesHolz = alteHoelzer[letztes]

            // Dieses HilfsView bedeckt den "abgebrannten" Teil
            // des Streichholzes. Es hat die Hintergrundfarbe der Vorlage.
            let abgebrannt = UIView(frame: altesHolz.frame)
            abgebrannt.backgroundColor = UIColor.whiteColor()
            abgebrannt.frame = CGRectMake(abgebrannt.frame.origin.x,
                                          abgebrannt.frame.origin.y,
                                          abgebrannt.frame.size.width,
                                          0.0)
            self.addSubview(abgebrannt)

            // Erzeuge das FlammenView-Objekt und zeige es an.
            let flamme = FlammenView(frame: altesHolz.frame)
            self.addSubview(flamme)

            // Löse die Animation aus, die Länge ist dabei die
            // Zfallszahl dauerInSekunden.
            UIView.animateWithDuration(1.0,
                                       animations: { () in
                                        // Die Animation besteht in einer Bewegung
                                        // von der aktuellen Position aus nach unten.
                                        flamme.transform = CGAffineTransformMakeTranslation(0, 50)
                                        abgebrannt.frame = altesHolz.frame
                }, completion: { (_ : Bool) in
                    // Entferne das Holz und beiden Hilfs-Views.
                    flamme.removeFromSuperview()
                    altesHolz.removeFromSuperview()
                    abgebrannt.removeFromSuperview()
            })
        }
        
        // Reduziere die Anzahl der sichtbaren Hölzer.
        self.sichtbareHoelzer = self.sichtbareHoelzer - anzahl
    }
}
