//
//  BasketView.swift
//  Navigation
//
//  Created by Ludovic Ollagnier on 17/05/2024.
//

import SwiftUI

struct BasketView: View {

    var router: Router
    var data: AppData
    @Binding var text: String

    @State var isDisplayed = false

    var body: some View {
        VStack {
            TextField("Name", text: $text)
            Button("Toggle") {
                isDisplayed.toggle()
            }
        }
    }
}

#Preview {
    BasketView(router: Router(), data: AppData(), text: .constant(""))
}
