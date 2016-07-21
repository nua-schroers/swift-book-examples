//: Playground - noun: a place where people can play

import UIKit

/// Liefere einen String zurück, der einen String enthält,
/// welcher das Alter von Steve und Woz vergleicht.
func vergleicheAlter(erstesAlter:Int, zweitesAlter:Int,
                     ersterName:String, zweiterName:String) -> String {
    if erstesAlter == zweitesAlter {
        return "\(ersterName) und \(zweiterName) sind gleich alt"
    } else if erstesAlter > zweitesAlter {
        return "\(ersterName) ist älter"
    } else {
        return "\(zweiterName) ist älter"
    }
}

vergleicheAlter(25, zweitesAlter: 25,
                ersterName: "Steve", zweiterName: "Woz")
// Liefert: "Steve und Woz sind gleich alt".
