//
//  ContentView.swift
//  SwipeAction
//
//  Created by Anurag Bhanderi on 20/06/21.
//

import SwiftUI

struct ContentView: View {
    
    var contacts = ["Vivek", "Darshan", "Garvit", "Darshak", "Dhanyavi", "Dhruvi"]
    
    var body: some View {
        NavigationView{
            List{
                ForEach(contacts, id: \.self){ names in
                    HStack{
                        Text(names)
                            .font(.headline)
                        
                        Spacer()
                        Text("Today")
                        Image(systemName: "info.circle")
                            .foregroundColor(.blue)
                    }
                }
            }
            .navigationBarTitle("Contacts")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
