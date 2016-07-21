//
//  ViewController.swift
//  HalloWelt
//
//  Created by Dr. Wolfram Schroers on 5/16/16.
//  Copyright © 2016 Wolfram Schroers. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Erzeuge ein Rechteck und speichere es in der Konstanten
        // dasRechteck.
        let dasRechteck = CGRectMake(10, 50, 300, 50)

        // Erzeuge ein Label und speichere es in der Konstanten dasLabel.
        let dasLabel = UILabel(frame: dasRechteck)

        // Setze Hintergrundfarbe und Text des Labels.
        dasLabel.backgroundColor = UIColor.lightGrayColor()
        dasLabel.text = "Hallo nochmals"

        // Stelle das Label auf dem Bildschirm dar.
        self.view.addSubview(dasLabel)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

