//
//  MoveUIApp.swift
//  MoveUI
//
//  Created by Ludovic Ollagnier on 16/05/2024.
//

import SwiftUI

@main
struct MoveUIApp: App {

    @State private var selection = "C"
    @State var path: [Screens] = []

    var body: some Scene {
        WindowGroup {
            TabView(selection: $selection) {
                NavigationStack {
                    ContentView()
                }
                .tabItem {
                    Text("Inventory")
                    Image(systemName: "list.bullet")
                }
                .tag("A")
                Text("B")
                    .tabItem {
                        Text("B")
                        Image(systemName: "b.circle")
                    }
                    .tag("B")
                Text("C")
                    .tabItem {
                        Text("C")
                        Image(systemName: "c.circle")
                    }
                    .tag("C")
            }
        }
    }


    func dummy() {
        var screen: Screens
        screen = .settings
        screen = .account
        screen = .product("cdgvfvf")
    }
}




enum Screens {
    case settings
    case product(String) // valeur associée
    case account
}












