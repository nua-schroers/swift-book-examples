//
//  StreichholzView.swift
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

    /// Konstruiere alle Hilfsobjekte.
    func setup() {
        // Das Quadrat für den Streichholzkopf.
        let kopfForm = CGRectMake(0, 0, 5, 10)

        // Das Quadrat für den Streichholzkörper.
        let koerperForm = CGRectMake(0, 0 + 10, 5, 45)

        // Erzeuge ein UIView für den Kopf.
        let kopf = UIView(frame: kopfForm)

        // Erzeuge ein UIView für den Körper.
        let koerper = UIView(frame: koerperForm)

        // Mache den Kopf rot.
        kopf.backgroundColor = UIColor.redColor()

        // Mache den Körper gelb.
        koerper.backgroundColor = UIColor.yellowColor()
        
        // Füge Kopf und Körper zum aktuellen UIView hinzu.
        self.addSubview(kopf)
        self.addSubview(koerper)
    }
}
