//
//  ContentView.swift
//  NavigationView
//
//  Created by Anurag Bhanderi on 31/05/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        FirstPage()
    }
}

struct FirstPage: View {
    var body: some View{
        NavigationView {
            VStack{
                Image(systemName: "house")
                    .resizable()
                    .frame(width: 200, height: 200)
                    .padding()
                Text("Home")
                    .font(.title)
                    .fontWeight(.heavy)
                    .padding()
                NavigationLink(
                    destination: SecondPage(),
                    label: {
                        Text("Second Page")
                            .padding()
                            .frame(width: 200, height: 50)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    })
            }
            .navigationTitle("Home Page")
        }
    }
}

struct SecondPage: View {
    var body: some View{
        VStack{
            Image(systemName: "airplane")
                .resizable()
                .frame(width: 200, height: 200)
                .padding()
            Text("Second Page")
                .font(.title)
                .fontWeight(.heavy)
                .padding()
            NavigationLink(
                destination: ThirdPage(),
                label: {
                    Text("Third Page")
                        .padding()
                        .frame(width: 200, height: 50)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                })
        }
        .navigationTitle("Second Page")
    }
}

struct ThirdPage: View {
    var body: some View{
        VStack{
            Image(systemName: "wifi")
                .resizable()
                .frame(width: 250, height: 200)
                .padding()
            Text("Third Page")
                .font(.title)
                .fontWeight(.heavy)
                .padding()
        }
        .navigationTitle("Third Page")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//That's It....
