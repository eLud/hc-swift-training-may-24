//
//  Item.swift
//  Move
//
//  Created by Ludovic Ollagnier on 14/05/2024.
//

import Foundation

struct Item {
    enum Condition: CaseIterable {
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
