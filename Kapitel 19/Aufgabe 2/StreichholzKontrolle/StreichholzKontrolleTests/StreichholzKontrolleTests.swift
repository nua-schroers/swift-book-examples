//
//  StreichholzKontrolleTests.swift
//  StreichholzKontrolleTests
//
//  Created by Dr. Wolfram Schroers on 5/23/16.
//  Copyright © 2016 Wolfram Schroers. All rights reserved.
//

import XCTest
@testable import StreichholzKontrolle

/// Test der Strategien im Streichholzspiel.
class StreichholzKontrolleTests: XCTestCase {

    // MARK: Eigenschaften für das Datenmodell.

    /// Datenmodell für den Spielstand.
    var spielHaufen: HolzHaufen = HolzHaufen()

    /// Datenmodell für die Computerzüge.
    var computerStrategie: ComputerStrategie?

    // MARK: Methoden für Vor- und Nachbereitung.

    /// Wird vor jedem Test ausgeführt.
    override func setUp() {
        super.setUp()

        // Erzeuge die Computerstrategie.
        self.computerStrategie = ComputerStrategie(haufen: self.spielHaufen)
    }

    /// Wird nach jedem Test ausgeführt.
    override func tearDown() {
        // Hier müssen Sie nichts machen.

        super.tearDown()
    }

    // MARK: Die eigentlichen Testfälle.

    /// Prüfe, ob ein Spiel korrekt als nicht verloren erkannt wird.
    func testSpielNichtVerloren() {
        // Vorbedingung.
        spielHaufen.hoelzer = 10

        // Prüfung, ob das Spiel verloren ist.
        XCTAssertEqual(spielHaufen.istVerloren(), false)
    }

    /// Prüfe, ob ein Spiel korrekt als verloren erkannt wird.
    func testSpielVerloren() {
        // Vorbedingung.
        spielHaufen.hoelzer = 0
        
        // Prüfung, ob das Spiel verloren ist.
        XCTAssertTrue(spielHaufen.istVerloren())
    }

    /// Prüfe den "dummen" Zug.
    func testDummerZug() {
        // Wähle die "dumme" Strategie aus.
        self.computerStrategie?.strategieTyp = 0

        // Vorbedingung.
        self.spielHaufen.hoelzer = 10

        // Durchführung des Zuges.
        let holzZahl = self.computerStrategie?.macheZug()

        // Prüfung, ob der Zug korrekt war.
        XCTAssertEqual(holzZahl, 1)
        XCTAssertEqual(self.spielHaufen.hoelzer, 9)
    }

    /// Teste den "klugen" Zug mit 10 Hölzern.
    func testKlugerZug() {
        // Wähle die "kluge" Strategie aus.
        self.computerStrategie?.strategieTyp = 2

        // Vorbedingung.
        self.spielHaufen.hoelzer = 10

        // Durchführung des Zuges.
        let holzZahl = self.computerStrategie?.macheZug()

        // Prüfung, ob der Zug korrekt war.
        XCTAssertEqual(holzZahl, 1)
        XCTAssertEqual(self.spielHaufen.hoelzer, 9)
    }

    /// Teste den "klugen" Zug mit 11 Hölzern.
    func testKlugerZug2() {
        // Wähle die "kluge" Strategie aus.
        self.computerStrategie?.strategieTyp = 2

        // Vorbedingung.
        self.spielHaufen.hoelzer = 11
        
        // Durchführung des Zuges.
        let holzZahl = self.computerStrategie?.macheZug()
        
        // Prüfung, ob der Zug korrekt war.
        XCTAssertEqual(holzZahl, 2)
        XCTAssertEqual(self.spielHaufen.hoelzer, 9)
    }
}
