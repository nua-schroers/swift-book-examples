//: Playground - noun: a place where people can play

import UIKit

/// Liefere einen String zurück, der einen String enthält,
/// welcher das Alter von Steve und Woz vergleicht.
func vergleicheAlter(alterSteve:Int, alterWoz:Int) -> String {
    if alterSteve == alterWoz {
        return "Steve und Woz sind gleich alt"
    } else if alterSteve > alterWoz {
        return "Steve ist älter"
    } else {
        return "Woz ist älter"
    }
}

vergleicheAlter(25, alterWoz: 25)
vergleicheAlter(23, alterWoz: 25)

