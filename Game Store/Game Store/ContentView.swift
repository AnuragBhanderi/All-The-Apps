//
//  ContentView.swift
//  Game Store
//
//  Created by Anurag Bhanderi on 03/05/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        //Bottom Navigation Bar
        TabView{
            
            Home().tabItem {
                Image("home")
            }
            Text("Globe").tabItem {
                Image("globe")
            }
            Text("Cart").tabItem {
                Image("cart")
            }
            Text("Favourite").tabItem {
                Image("heart")
            }
            Text("Account").tabItem {
                Image("user")
            }
        }
        .accentColor(Color("Color"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home: View {
    
    @State var selected = "Game"
    var body: some View{
        
        VStack(spacing: 15){
            
            // Title and serach Icon
            HStack{
                
                Text("Game Store")
                    .font(.title)
                    .fontWeight(.heavy)
                    
                Spacer()
                
                Button(action: {
                    
                }) {
                    Image("search")
                        .renderingMode(.original)
                }
            }
            .padding(.top, 10)
            // Scroll Bar
            ScrollView(.horizontal, showsIndicators: false){
                
                HStack{
                    
                    ForEach(scrolllist, id: \.self){i in
                        
                        Button(action: {
                            self.selected = i
                        }) {
                            Text(i)
                                .padding()
                                .foregroundColor(self.selected == i ? Color.black : Color.gray)
                                .overlay(
                                    Capsule()
                                        .fill(self.selected == i ? Color("Color") : Color.clear)
                                        .frame(height: 5)
                                        .padding(.top, 35)
                                )
                        }
                    }
                }
            }
            
            middleView()
            bottomView()
        }
        .padding()
    }
}

struct middleView: View {
    
    @State var show = false
    
    var body: some View{
        
        VStack(spacing:15){
            
            ScrollView(.horizontal, showsIndicators: false){
                
                // Scrolling Game Cards
                HStack{
                    
                    ForEach(toplist, id: \.self){i in
                        
                        Image(i)
                            .renderingMode(.original)
                            .onTapGesture {
                                
                                //Tap On Cards
                                self.show.toggle()
                                
                            }
                    }
                }
            }
            .padding(.vertical, 15)
            
            // Category
            HStack(spacing: 15){
                
                Button(action: {
                    
                }) {
                    Image("trophy")
                        .renderingMode(.original)
                }
                
                Button(action: {
                    
                }) {
                    Image("cards")
                        .renderingMode(.original)
                }
                
                Button(action: {
                    
                }) {
                    Image("puzzle")
                        .renderingMode(.original)
                }
                
                Button(action: {
                    
                }) {
                    Image("punch")
                        .renderingMode(.original)
                }
            }
        }
        .sheet(isPresented: self.$show){
            ExpandView(show: self.$show)
        }
    }
}

struct bottomView: View {
    var body: some View{
        
        VStack(spacing: 15){
            
            //Title of Section
            HStack(spacing: 10){
                
                Capsule()
                    .fill(Color("Color"))
                    .frame(width: 5, height: 25)
                
                Text("New and Trending")
                
                Spacer()
            }
            .padding(.vertical, 15)
            
            //Small Cards Scroll View
            ScrollView(.horizontal, showsIndicators: false){
                
                // Scrolling Game Cards
                HStack{
                    
                    ForEach(bottomlist){i in
                        
                        VStack(alignment: .leading, spacing: 8){
                            Image(i.image)
                                .renderingMode(.original)
                            Text(i.name)
                            Image("os")
                            Text(i.price)
                                .foregroundColor(Color("Color"))
                            
                        }
                    }
                }
            }
    
        }
    }
}

struct ExpandView: View {
    
    @Binding var show: Bool
    var body: some View {
        
        VStack{
             
            ZStack{
                
                Image("top")
                    .resizable()
                    .frame(height: 250)
                Button(action: {
                    
                }) {
                    Image(systemName: "play.circle.fill")
                        .font(.largeTitle)
                }
                .foregroundColor(.white)
            }
            .overlay(
                VStack{
                    
                    HStack{
                        
                        Button(action: {
                            self.show.toggle()
                        }) {
                            Image(systemName: "chevron.left")
                                .font(.body)
                        }
                        .foregroundColor(.white)
                        
                        Spacer()
                        
                        Button(action: {
                            
                        }) {
                            Image("search")
                        }
                        .foregroundColor(.white)
                        
                    }
                    .padding()
                    
                    Spacer()
                }
            )
            ScrollView(.vertical, showsIndicators: false){
                expandBottom()
            }
        }
        
    }
}

struct expandBottom: View {
    
    @State var selected = "Information"
    
    var body: some View{
        
        VStack(alignment: .leading,spacing: 15){
            
            HStack{
                
                Image("logo")
                    .renderingMode(.original)
                
                VStack(alignment: .leading, spacing: 8){
                    Text("Cat Quest")
                    Text("Anurag Bhanderi")
                    Image("os")
                }
                .padding(.leading, 10)
                
                Spacer()
                
                Button(action: {
                    
                }) {
                    
                    Image("heartplus")
                        .renderingMode(.original)
                        .resizable()
                        .frame(width: 22, height: 20)
                }
                .foregroundColor(.white)
                .padding(.bottom, 35)
                
            }
            
            HStack(spacing: 15){
                
                Spacer()
                
                Text("$9.99")
                    .foregroundColor(Color("Color"))
                
                Button(action: {
                    
                }) {
                    Text("Add to Cart")
                        .padding(.horizontal, 16)
                        .padding(.vertical, 10)
                }
                .foregroundColor(.white)
                .background(Capsule().fill(Color("Color")))
            }
            
            Text("Screenshots")
                .fontWeight(.heavy)
            
            ScrollView(.horizontal, showsIndicators: false){
                
                HStack{
                    
                    ForEach(infos, id: \.self){i in
                        
                        Image(i)
                            .renderingMode(.original)
                    }
                }
            }
            .padding(.vertical, 15)
            
            HStack{
                
                Spacer()
                
                ForEach(options, id: \.self){i in
                    
                    
                    Button(action: {
                        self.selected = i
                    }){
                        
                        Text(i)
                            .font(.system(size: 18))
                            .padding()
                            .foregroundColor(self.selected == i ? Color("Color") : Color.gray)
                            .overlay(
                                Capsule()
                                    .fill(self.selected == i ? Color("Color") : Color.clear)
                                    .frame(height: 5)
                                    .padding(.top, 35)
                            )
                    }
                }
                Spacer()
            }
            
            if self.selected == "Information"{
                Text("Leap into a Grand Adventure of Dragons, Magic and Cats in purr-suit of the Evil Drakoth and your catnapped sister! Explore Felingard's huge overworld map, risk life and delving into dungeons for epic loot, and lent a paw to a furry cast of characters in a flurry of side quests")
                    .padding()
            }
            else{
                Text("Ohhh... Yehhh..!!!")
                    .padding()
            }
        }
        .padding()
        .animation(.spring())
    }
}


var scrolllist = ["Game", "App", "Pre-Order", "App-Purchases"]

var toplist = ["s2", "s1", "s3"]

var infos = ["info1", "info2", "info3"]

var options = ["Information", "Reviews"]

struct type: Identifiable {
    
    var id: Int
    var name: String
    var price: String
    var image: String
}

var bottomlist = [
    type(id: 0, name: "Tiny Guardians", price: "$29.99", image: "h1"),
    type(id: 1, name: "Kingdom Rush", price: "$15.99", image: "h2"),
    type(id: 2, name: "Dragon Heroes", price: "$9.99", image: "h3"),
    type(id: 3, name: "War of Crown", price: "$19.99", image: "h4"),
]
