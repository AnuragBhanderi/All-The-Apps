//
//  ContentView.swift
//  ListView
//
//  Created by Anurag Bhanderi on 17/06/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        FoodList()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct FoodList: View {
    var body: some View{
        NavigationView{
            List(emojilist){ emojis in
                NavigationLink(
                    destination: Text("\(emojis.name)"),
                    label: {
                        HStack{
                            ZStack{
                                Text("\(emojis.emoji)")
                                    .padding()
                                    .font(.largeTitle)
                                    .shadow(radius: 5)
                                    .overlay(
                                        Circle()
                                            .stroke(Color.gray,lineWidth: 3)
                                    )
                            }
                            Text("\(emojis.name)")
                                .font(.headline)
                                .padding()
                        }
                    })
            }
            .navigationBarTitle("Food List")
        }
    }
}

struct EmojiItem: Identifiable {
    let id = UUID()
    var emoji: String
    var name: String
}

private let emojilist: [EmojiItem] = [
    EmojiItem(
            emoji: "🥑",
            name: "Avocado"
        ),
        EmojiItem(
            emoji: "🍟",
            name: "French Fries"),
        EmojiItem(
            emoji: "🍕",
            name: "Pizza"),
]

// That's It...
