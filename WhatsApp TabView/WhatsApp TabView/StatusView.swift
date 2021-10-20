//
//  StatusView.swift
//  WhatsApp TabView
//
//  Created by Anurag Bhanderi on 30/05/21.
//

import SwiftUI

struct StatusView: View {
    var body: some View {
        VStack {
            ZStack{
                Circle()
                    .frame(width: 300, height: 300)
                    .foregroundColor(.green)
                Image(systemName: "circle.dashed")
                    .resizable()
                    .frame(width: 200, height: 200)
            }
            Text("Status")
                .padding()
                .font(.system(size: 60, weight: .bold))
        }
        .padding()
    }
}

struct StatusView_Previews: PreviewProvider {
    static var previews: some View {
        StatusView()
    }
}
