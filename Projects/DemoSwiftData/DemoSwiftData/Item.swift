//
//  Item.swift
//  DemoSwiftData
//
//  Created by Ludovic Ollagnier on 17/05/2024.
//

import Foundation
import SwiftData

@Model
class User {
    var name: String
    var birthYear: Int

    @Relationship(deleteRule: .cascade, inverse: \Message.user)
    var messages: [Message]

    init(name: String, birthYear: Int) {
        self.name = name
        self.birthYear = birthYear
        messages = []
    }
}

@Model
class Message {
    var content: String

    var user: User

    init(user: User, content: String) {
        self.content = content
        self.user = user
    }
}
