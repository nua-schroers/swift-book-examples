//
//  StreichholzViewAlt.swift
//  StreichholzAnzeiger
//
//  Created by Dr. Wolfram Schroers on 5/17/16.
//  Copyright © 2016 Wolfram Schroers. All rights reserved.
//

import UIKit

/// Darstellung eines einzelnen Streichholzes.
class StreichholzView: UIView {

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
        // Setze den eigenen Hintergrund auf "durchsichtig"
        // ("clearColor").
        self.backgroundColor = UIColor.clearColor()
    }

    override func drawRect(rect: CGRect) {
        // Speichere den aktuellen Prozesskontext in
        // der Konstanten context.
        let context = UIGraphicsGetCurrentContext()

        // Zeichne den Streichholzkörper als Quadrat
        // in gelber Farbe.
        UIColor.yellowColor().set()
        CGContextMoveToPoint(context, 5, 5)
        CGContextAddLineToPoint(context, 10, 5)
        CGContextAddLineToPoint(context, 10, 55)
        CGContextAddLineToPoint(context, 5, 55)

        // Fülle den Streichholzkörper mit der
        // aktuellen Farbe (also Gelb).
        CGContextDrawPath(context, .FillStroke)

        // Zeichne den Streichholzkopf als Ellipse
        // mit roter Farbe.
        UIColor.redColor().set()
        let kopfForm = CGRectMake(2, 0, 11, 20)
        CGContextAddEllipseInRect(context, kopfForm)
        
        // Fülle den Streichholzkopf mit der
        // aktuellen Farbe (also Rot).
        CGContextDrawPath(context, .FillStroke)
    }
}
