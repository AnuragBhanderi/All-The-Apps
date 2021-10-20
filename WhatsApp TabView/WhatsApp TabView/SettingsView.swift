//
//  SettingsView.swift
//  WhatsApp TabView
//
//  Created by Anurag Bhanderi on 30/05/21.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        VStack {
            ZStack{
                Circle()
                    .frame(width: 300, height: 300)
                    .foregroundColor(.green)
                Image(systemName: "gear")
                    .resizable()
                    .frame(width: 200, height: 200)
            }
            Text("Settings")
                .padding()
                .font(.system(size: 60, weight: .bold))
        }
        .padding()
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
