//
//  ContentView.swift
//  Instagram TabBar
//
//  Created by Anurag Bhanderi on 23/05/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var index = 0
    
    var body: some View {
        VStack{
            ZStack{
                if self.index == 0{
                    Color.green.edgesIgnoringSafeArea(.all)
                    
                    Text("Home")
                        .font(.largeTitle)
                }
                else if self.index == 1{
                    Color.yellow.edgesIgnoringSafeArea(.all)
                    
                    Text("Search")
                        .font(.largeTitle)
                }
                else if self.index == 2{
                    Color.purple.edgesIgnoringSafeArea(.all)
                    
                    Text("Post")
                        .font(.largeTitle)
                }
                else if self.index == 3{
                    Color.pink.edgesIgnoringSafeArea(.all)
                    
                    Text("Like")
                        .font(.largeTitle)
                }
                else{
                    Color.red.opacity(0.5).edgesIgnoringSafeArea(.all)
                    
                    Text("Account")
                        .font(.largeTitle)
                }
                
                
                CustomTabBar(index: $index)
            }
            .animation(.easeOut(duration: 0.5))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CustomTabBar: View {
    
    @Binding var index: Int
    var body: some View{
        
        VStack{
            
            Spacer()
            
            HStack{
                
                Button(action: {
                    self.index = 0
                }, label: {
                    VStack{
                        if self.index != 0{
                            Image(systemName: "house")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .foregroundColor(.white)
                                .padding()
                        }
                        else{
                            Image(systemName: "house.fill")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .foregroundColor(.white)
                                .padding()
                        }
                        
                    }
                    
                })
                
                Button(action: {
                    self.index = 1
                }, label: {
                    VStack{
                        if self.index != 1{
                            Image(systemName: "magnifyingglass.circle")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .foregroundColor(.white)
                                .padding()
                        }
                        else{
                            Image(systemName: "magnifyingglass.circle.fill")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .foregroundColor(.white)
                                .padding()
                        }
                        
                    }
                })
                
                Button(action: {
                    self.index = 2
                }, label: {
                    VStack{
                        if self.index != 2{
                            Image(systemName: "plus.app")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .foregroundColor(.white)
                                .padding()
                        }
                        else{
                            Image(systemName: "plus.app.fill")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .foregroundColor(.white)
                                .padding()
                        }
                        
                    }
                })
                
                Button(action: {
                    self.index = 3
                }, label: {
                    VStack{
                        if self.index != 3{
                            Image(systemName: "heart")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .foregroundColor(.white)
                                .padding()
                        }
                        else{
                            Image(systemName: "heart.fill")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .foregroundColor(.white)
                                .padding()
                        }
                        
                    }
                })
                
                Button(action: {
                    self.index = 4
                }, label: {
                    VStack{
                        if self.index != 4{
                            Image(systemName: "person.crop.circle")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .foregroundColor(.white)
                                .padding()
                        }
                        else{
                            Image(systemName: "person.crop.circle.fill")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .foregroundColor(.white)
                                .padding()
                        }
                        
                    }
                })
                
            }
            .padding()
            .background(Color.black)
            .cornerRadius(20)
            .shadow(radius: 30)
            .animation(.default)
        }
        
    }
}
