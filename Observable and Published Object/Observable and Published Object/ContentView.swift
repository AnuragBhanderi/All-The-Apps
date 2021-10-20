//
//  ContentView.swift
//  Observable and Published Object
//
//  Created by Anurag Bhanderi on 02/07/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var user = User()
    var body: some View {
    
        VStack{
            Text("Your name is \(user.firstName) \(user.lastName)")
                .padding()
            TextField("\(user.firstName)", text: $user.firstName)
                .padding()
            TextField("\(user.lastName)", text: $user.lastName)
                .padding()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

class User: ObservableObject{
    @Published var firstName = "Anurag"
    @Published var lastName = "Bhanderi"
}
