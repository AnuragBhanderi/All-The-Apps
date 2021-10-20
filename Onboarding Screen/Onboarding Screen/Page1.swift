//
//  Page1.swift
//  Onboarding Screen
//
//  Created by Anurag Bhanderi on 05/06/21.
//

import SwiftUI

struct Page1: View {
    var body: some View {
        NavigationView {
            VStack {
                    
                    HStack{
                        
                        Spacer()
                        
                        Button(action: {
                            
                        }, label: {
                            Text("Skip")
                                .font(Font.custom("Ubuntu-Bold", size: 14))
                                .foregroundColor(Color("lightgray"))
                        })
                    }
                    .padding(.trailing, 22)
                    .padding(.bottom, 50)
                    
                    HStack {
                        VStack(alignment: .leading){
                            Text("Welcome to")
                                .font(Font.custom("Ubuntu-Regular", size: 25))
                            Text("Your App name")
                                .font(Font.custom("Ubuntu-Bold", size: 31))
                        }
                        .padding(.bottom, 24)
                        
                        Spacer()
                    }
                    .padding(.leading, 19)
                    
                    HStack{
                        Text("""
                            Lorem Ipsum is simply dummy text of the
                            printing and typesetting industry.
                            """)
                            .font(Font.custom("Ubuntu-Regular", size: 16))
                            .foregroundColor(Color("lightgray"))
                            .animation(.easeOut(duration: 2))
                            .lineLimit(2)
                            
                        
                        Spacer()
                    }
                    .padding(.leading, 19)
                    .padding(.bottom, 51.3)
                    
                    HStack{
                        Image("1")
                            .resizable()
                            .frame(width: 323.91, height: 270.99)
                            .aspectRatio(contentMode: .fit)
                    }
                    .padding(.bottom, 148.7)
                    
                    HStack{
                        Button(action: {
                            
                        }, label: {
                            
                            HStack(spacing: 3){
                                Circle()
                                    .foregroundColor(Color("blue"))
                                    .frame(width: 10, height: 10)
                                Circle()
                                    .foregroundColor(Color("lightblue"))
                                    .frame(width: 10, height: 10)
                                Circle()
                                    .foregroundColor(Color("lightblue"))
                                    .frame(width: 10, height: 10)
                            }
                            .frame(width: 10, height: 10)
                            .padding(.leading, 35)
                        })
                        
                        Spacer()
                        
                        Button(action: {
                            
                        }, label: {
                            ZStack{
                                Circle()
                                    .foregroundColor(Color("blue"))
                                    .frame(width: 67, height: 67)
                                Text("Next")
                                    .font(Font.custom("Ubuntu-Regular", size: 16))
                                    .foregroundColor(.white)
                            }
                            .padding(.trailing, 19)
                        })
                        
                    }
                    .padding()
            }
            .navigationBarHidden(true)
        }
    }
}

struct Page1_Previews: PreviewProvider {
    static var previews: some View {
        Page1()
    }
}
