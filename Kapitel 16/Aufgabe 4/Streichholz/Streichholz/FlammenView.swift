//
//  FlammenView.swift
//  Streichholz
//
//  Created by Dr. Wolfram Schroers on 5/19/16.
//  Copyright © 2016 Wolfram Schroers. All rights reserved.
//

import UIKit

// Diese Klasse zeigt den weißen Kreis an, der die
// Verschwindeanimation begleitet.
class FlammenView: UIView {
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

        // Zeichne auch außerhalb des eigenen Rahmens.
        self.clipsToBounds = false
    }

    override func drawRect(rect: CGRect) {
        // Speichere den aktuellen Prozesskontext in
        // der Variablen context.
        let context = UIGraphicsGetCurrentContext()

        // Zeichne den Streichholzkopf als Ellipse
        // mit oranger Farbe. Die Ellipse hat zwei gleiche
        // Innenradien, dadurch wird sie zu einem Kreis.
        UIColor.orangeColor().set()
        let kopfForm = CGRectMake(0, 0, 15, 15)
        CGContextAddEllipseInRect(context, kopfForm)

        // Fülle den Streichholzkopf mit der
        // aktuellen Farbe (also orange).
        CGContextDrawPath(context, .FillStroke)
    }
}
