//
//  DemoSwiftDataApp.swift
//  DemoSwiftData
//
//  Created by Ludovic Ollagnier on 17/05/2024.
//

import SwiftUI
import SwiftData

@main
struct DemoSwiftDataApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            User.self,
            Message.self
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
