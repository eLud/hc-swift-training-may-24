//
//  Library.swift
//  Move
//
//  Created by Ludovic Ollagnier on 14/05/2024.
//

import Foundation

class Library { // Class because reference

    private(set) var items: [Item]

    // Get-only computed property
    var allItems: [Item] { items }
    
    var count: Int {
        items.count
    }

    init(items: [Item] = []) {
        self.items = items
    }

    func add(_ item: Item) {
        items.append(item)
        let notifCenter = NotificationCenter.default
        notifCenter.post(name: Notification.Name("modelUpdated"), object: self)
    }

    func remove(_ item: Item) {
        // trouver l'index
        guard let index = items.firstIndex(of: item) else { return }
        items.remove(at: index)
        let notifCenter = NotificationCenter.default
        notifCenter.post(name: Notification.Name("modelUpdated"), object: self)
    }
}
