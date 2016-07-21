//: Playground - noun: a place where people can play

import UIKit

// MARK: Abschnitt 7.4

/// Eine Klasse, die einen Antrieb beschreibt.
class WarpAntrieb {
    /// Die tatsächliche Geschwindigkeit.
    /// Dieser Wert ist nach außen nicht sichtbar.
    private var geschwindigkeit = 1.0

    /// Eine Eigenschaft für die Geschwindigkeit als warpFaktor.
    var warpFaktor: Double {
        /// Wird aufgerufen, wenn der Wert abgefragt wird.
        get {
            return self.geschwindigkeit
        }

        /// Wird aufgerufen, wenn der Wert geändert wird.
        set(neuerWarpFaktor) {
            self.geschwindigkeit = neuerWarpFaktor
        }
    }

    /// Hilfskonstante für die Lichtgeschwindigkeit in km/h.
    private let lichtgeschwindigkeitInKmH = 1079252848.8

    /// Eine Eigenschaft für die Geschwindigkeit in km/h.
    var kmh: Double {
        /// Wird aufgerufen, wenn der Wert abgefragt wird.
        get {
            return self.geschwindigkeit * lichtgeschwindigkeitInKmH
        }

        /// Wird aufgerufen, wenn der Wert geändert wird.
        set(neueGeschwindigkeit) {
            self.geschwindigkeit = neueGeschwindigkeit / lichtgeschwindigkeitInKmH
        }
    }

    /// Die Änderung der Geschwindigkeit um konkrete Werte.
    /// Diese Methode ist nach außen nicht sichtbar.
    private func aendereGeschwindigkeit(wert:Double) {
        self.geschwindigkeit += wert
    }

    /// Beschleunige.
    func beschleunigen() {
        self.aendereGeschwindigkeit(1.0)
    }

    /// Bremse ab.
    func abbremsen() {
        self.aendereGeschwindigkeit(-1.0)
    }

    /// Beschreibe die aktuelle Geschwindigkeit.
    func wieSchnellBinIch() -> String {
        if geschwindigkeit < 1.5 {
            return "lahm"
        } else {
            return "verdammt fix"
        }
    }
}

// Erzeuge ein Objekt mit einem Warpantrieb.
let enterprise = WarpAntrieb()

// Beschleunige auf warp 8.
enterprise.warpFaktor = 8.0

// Liefere die Geschwindigkeit in km/h (8634022790.4 km/h).
enterprise.kmh
