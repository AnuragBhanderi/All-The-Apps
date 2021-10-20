//
//  ContentView.swift
//  WhatsApp TabView
//
//  Created by Anurag Bhanderi on 30/05/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var defaultPage = 3
    var body: some View {
        TabView(selection: $defaultPage){
            StatusView()
                .tabItem {
                    Text("Status")
                    Image(systemName: "circle.dashed")
                }
                .tag(0)
            CallView()
                .tabItem {
                    Text("Call")
                    Image(systemName: "phone")
                }
                .tag(1)
            Camera_View()
                .tabItem {
                    Text("Camera")
                    Image(systemName: "camera")
                }
                .tag(2)
            ChatView()
                .tabItem {
                    Text("Chat")
                    Image(systemName: "message")
                }
                .tag(3)
            SettingsView()
                .tabItem {
                    Text("Settings")
                    Image(systemName: "gear")
                }
                .tag(4)
        }
        .accentColor(.red)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
