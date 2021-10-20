//
//  ContentView.swift
//  MapKit_Live_Location
//
//  Created by Anurag Bhanderi on 18/08/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct NavView: View {
    var body: some View{
        
        NavigationView{
            
            TabView{
                
                Image(systemName: "house.fill")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("Home")
                    }
                    .tag("1")
                    
                Image(systemName: "cart.fill")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .tabItem {
                        Image(systemName: "cart.fill")
                        Text("Cart")
                    }
                    .tag("2")
                Image(systemName: "suit.heart.fill")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .tabItem {
                        Image(systemName: "suit.heart.fill")
                        Text("Wishlist")
                    }
                    .tag("3")
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .tabItem {
                        Image(systemName: "person.circle.fill")
                        Text("Login")
                    }
                    .tag("4")
                
            }
            .accentColor(.black)
            .navigationTitle("La' Pastel")
        }
        
    }
}
