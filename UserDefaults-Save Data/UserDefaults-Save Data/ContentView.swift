//
//  ContentView.swift
//  UserDefaults-Save Data
//
//  Created by Anurag Bhanderi on 03/07/21.
//

import SwiftUI

struct ContentView: View {
    @State var tapCount = UserDefaults.standard.integer(forKey: "Tap")
    var body: some View {
        Button("Tap Count : \(tapCount)"){
            self.tapCount += 1
            UserDefaults.standard.setValue(self.tapCount, forKey: "Tap")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
