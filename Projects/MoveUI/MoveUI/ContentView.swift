//
//  ContentView.swift
//  MoveUI
//
//  Created by Ludovic Ollagnier on 16/05/2024.
//

import SwiftUI

struct ContentView: View {

    @State private var name = ""
    @State private var toSell = true
    @State private var price: Double?
    @State private var condition = Item.Condition.perfect
    @State private var url = ""

    var body: some View {
        Form {
            nameSection
            sellSection
            conditionSection
            Button("Save", action: save)

            NavigationLink {
                Text("Navigated!")
            } label: {
                HStack {
                    Image(systemName: "leaf")
                    Text("Hello")
                }
            }
        }
    }

    private var nameSection: some View {
        Section {
            TextField("Name", text: $name)
        }
    }

    private var sellSection: some View {
        Section {
            Toggle(isOn: $toSell.animation(), label: {
                Text("To sell")
            })
            ImagedToggle(isOn: $toSell)
            if toSell {
                TextField("Price", value: $price, format: .currency(code: "EUR"))
                TextField("URL", text: $url)
            }
        }
    }

    private var conditionSection: some View {
        Section {
            Picker("Condition", selection: $condition) {
                Text("perfect")
                    .tag(Item.Condition.perfect)
                Text("ok")
                    .tag(Item.Condition.ok)
                Text("bad")
                    .tag(Item.Condition.bad)
            }
            .pickerStyle(.navigationLink)
        }
    }

    private func save() {
        guard name.count > 2 else { return }
        guard let price = price else { return }
        guard let url = URL(string: url) else { return }

        let item = Item(name: name, price: price, comment: "", toSell: toSell, condition: condition)
    }

    func networkRequest() async {
        let url = URL(string: "http://www.apple.com")!
        let urlRequest = URLRequest(url: url)
        
        do {
            let data = try await URLSession.shared.data(for: urlRequest)
        } catch {
            print(error)
        }

        guard let data = try? await URLSession.shared.data(for: urlRequest) else { return }
    }
}

#Preview {
    NavigationStack {
        ContentView()
    }
}
