//
//  ViewController.swift
//  Netzbrowser
//
//  Created by Dr. Wolfram Schroers on 5/20/16.
//  Copyright © 2016 Wolfram Schroers. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    /// Manipulierte Datei, um einen Zähler im Hintergrund anzuzeigen.
    override func viewDidLoad() {
        super.viewDidLoad()

        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
            () -> Void in
            var zaehler = 0

            // Gib die Zahlen 1–10 aus, jede Sekunde die nächste.
            while zaehler < 10 {
                sleep(1)
                zaehler += 1
                print(zaehler)
            }
        }

        // Diese Methode ist sofort "fertig"!
        print("Fertig!")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    /// Der Benutzer hat eine Adresse in die Leiste eingegeben.
    @IBAction func benutzerHatAdresseEingegeben(sender: AnyObject) {
        // Hole den Text aus dem Textfeld, falls er gültig ist.
        if let textFeld = sender as? UITextField,
            let eingabe:String = textFeld.text {
            // Erzeuge aus dem String eine URL.
            let webAdresse = NSURL(string: eingabe)

            // Erzeuge aus der URL einen NSURLRequest.
            let anforderung = NSURLRequest(URL: webAdresse!)

            // Fordere das Webview auf, die Seite zu laden.
            self.seitenAnsicht.loadRequest(anforderung)
        }
    }

    @IBOutlet weak var seitenAnsicht: UIWebView!
}

