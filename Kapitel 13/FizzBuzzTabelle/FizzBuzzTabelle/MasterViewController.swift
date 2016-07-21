//
//  MasterViewController.swift
//  FizzBuzzTabelle
//
//  Created by Dr. Wolfram Schroers on 5/17/16.
//  Copyright © 2016 Wolfram Schroers. All rights reserved.
//

import UIKit

/// Vollständige fizzBuzz–Funktion, liefere das regel–konforme
/// Ergebnis als String zurück.
func fizzBuzz(x:Int) -> (String) {
    // Deklariere das Ergebnis.
    var ergebnis:String

    if (x % 15 == 0) {
        // Fall: Teilbar durch 15.
        ergebnis = "FizzBuzz"
    } else {
        if (x % 5 == 0) {
            // Fall: Teilbar durch 5.
            ergebnis = "Buzz"
        } else {
            if (x % 3 == 0) {
                // Fall: Teilbar durch 3.
                ergebnis = "Fizz"
            } else {
                // Ansonsten: eine normale Zahl.
                ergebnis = String(x)
            }
        }
    }

    // Gib das Ergebnis zurück.
    return ergebnis
}

/// Tabelle mit Einträgen des FizzBuzz–Spiels.
class MasterViewController: UITableViewController {

    /// Der zweite View Controller.
    var detailViewController: DetailViewController? = nil

    /// Wird zu Beginn von iOS aufgerufen.
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        // Setze den zweiten View Controller (die Detailseite).
        if let split = self.splitViewController {
            let controllers = split.viewControllers
            self.detailViewController = (controllers[controllers.count-1] as!
                UINavigationController).topViewController as? DetailViewController
        }
    }

    // Wird von iOS aufgerufen, wenn der Bildschirm erscheint.
    override func viewWillAppear(animated: Bool) {
        self.clearsSelectionOnViewWillAppear = self.splitViewController!.collapsed
        super.viewWillAppear(animated)
    }

    // MARK: - Segues

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Wird nur beim "showDetail" Segue ausgeführt.
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                // Setze den controller als assoziierten DetailViewController.
                let controller = (segue.destinationViewController as!
                    UINavigationController).topViewController as!
                    DetailViewController

                // Setze die detailItem Eigenschaft des DetailViewControllers.
                controller.detailItem = fizzBuzz(indexPath.row + 1)

                // Konfiguriere den "Zurück"-Button.
                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }

    // MARK: - Table View

    /// Liefere die Zahl der Tabellenabschnitte.
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // Diese Tabelle hat nur einen Abschnitt.
        return 1
    }

    /// Liefere die Zahl der Tabellenzeilen in einem Abschnitt.
    override func tableView(tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        // Die Tabelle hat 100 Zeilen.
        return 100
    }

    /// Liefere eine Tabellenzelle für eine bestimmte Stelle.
    override func tableView(tableView: UITableView,
                            cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // Erzeuge eine neue Zelle.
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell",
                                                               forIndexPath: indexPath)

        // Setze den Text auf die Zeilennummer oder
        // "Fizz" , "Buzz" oder "FizzBuzz".
        let fizzBuzzText = fizzBuzz(indexPath.row + 1)
        cell.textLabel!.text = fizzBuzzText
        return cell
    }
}

