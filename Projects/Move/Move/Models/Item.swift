//
//  Item.swift
//  Move
//
//  Created by Ludovic Ollagnier on 14/05/2024.
//

import Foundation

struct Item {

    // Condition est un type imbriqué, à l'usage Item.Condition
    enum Condition: Int, CaseIterable { //raw value: Int, Double, String, Character
        case perfect
        case ok
        case bad
    }

    let name: String
    var price: Double
    var comment: String
    var toSell: Bool

    var sellWebsiteURL: URL?
    let condition: Condition

    var photo: Data? // (nil / Data)
}
