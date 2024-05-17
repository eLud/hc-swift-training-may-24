//
//  Item.swift
//  MoveUI
//
//  Created by Ludovic Ollagnier on 16/05/2024.
//

import Foundation

struct Item: Equatable {

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
