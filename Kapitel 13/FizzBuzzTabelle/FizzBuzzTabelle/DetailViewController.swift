//
//  DetailViewController.swift
//  FizzBuzzTabelle
//
//  Created by Dr. Wolfram Schroers on 5/17/16.
//  Copyright © 2016 Wolfram Schroers. All rights reserved.
//

import UIKit

/// Detailbildschirm, wird nach Antippen einer Tabellenzelle angezeigt.
class DetailViewController: UIViewController {

    /// Label in der Mitte des Bildschirms.
    @IBOutlet weak var detailDescriptionLabel: UILabel!

    /// Eigenschaft für den angezeigten Text.
    var detailItem: AnyObject? {
        didSet {
            // Das View wird immer angepasst, wenn sich der Text ändert.
            self.configureView()
        }
    }

    /// Passe das Label an.
    func configureView() {
        if let detail = self.detailItem {
            // Wird ausgeführt, falls das detailItem nicht nil ist.
            if let label = self.detailDescriptionLabel {
                label.text = detail.description
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Konfiguriere das Label beim erstmaligen Laden.
        self.configureView()
    }
}
