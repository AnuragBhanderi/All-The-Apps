//
//  ChatView.swift
//  WhatsApp TabView
//
//  Created by Anurag Bhanderi on 30/05/21.
//

import SwiftUI

struct ChatView: View {
    var body: some View {
        VStack {
            ZStack{
                Circle()
                    .frame(width: 300, height: 300)
                    .foregroundColor(.green)
                Image(systemName: "message")
                    .resizable()
                    .frame(width: 200, height: 200)
            }
            Text("Chat")
                .padding()
                .font(.system(size: 60, weight: .bold))
        }
        .padding()
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
