//
//  ContentView.swift
//  Watch Store
//
//  Created by Anurag Bhanderi on 02/05/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var detail = false
     
    @State var detailData: Watch = data[0]
    var body: some View {
        ZStack{
            
            Detail(detailData: self.$detailData, detai: self.$detail)
                .frame(width: self.detail ? nil : 100, height: self.detail ? nil : 100)
                .opacity(self.detail ? 1 : 0)
            
            Home(detailData: self.$detailData, detail: self.$detail)
                .opacity(self.detail ? 0 : 1)
        }
        .animation(.default)
        .preferredColorScheme(self.detail ? .dark : .light)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct Home: View {
    
    @State var index = "ALL"
    @State var tab = 0
    @Binding var detailData: Watch
    @Binding var detail: Bool
    
    var bottom = UIApplication.shared.windows.first?.safeAreaInsets.bottom
    
    var body: some View{
        ZStack{
            
            Color.black.opacity(0.06).edgesIgnoringSafeArea(.all)
            
            VStack{
                
                HStack{
                    
                    Button(action: {
                        
                    }) {
                        Image(systemName: "line.horizontal.3.decrease.circle")
                            .font(.title)
                            .foregroundColor(.black)
                            .padding(.horizontal)
                    }
                    Spacer()
                    Button(action: {
                        
                    }) {
                        Image(systemName: "cart")
                            .font(.title)
                            .foregroundColor(.black)
                            .padding(.horizontal)
                    }
                }
                .padding(.vertical)
                
                HStack{
                    VStack(alignment: .leading, spacing: 10){
                        Text("WelCome..!")
                        
                        Text("Discovery")
                            .font(.title)
                            .fontWeight(.bold)
                    }
                    .foregroundColor(.black)
                    
                    Spacer()
                    
                    Button(action: {
                        
                    }) {
                        Image(systemName: "magnifyingglass")
                            .font(.title)
                            .foregroundColor(.black)
                    }
                }
                .padding()
                
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    HStack(spacing: 25){
                        
                        ForEach(menu,id: \.self){ i in
                            Button(action: {
                                self.index = i
                            }) {
                                Text(i)
                                    .foregroundColor(self.index == i ? Color("Color1") : Color.black.opacity(0.6))
                                    .fontWeight(.bold)
                            }
                        }
                    }
                    .padding(.horizontal)
                }
                
                ScrollView(.horizontal, showsIndicators: false){
                    
                    HStack(spacing: 25){
                        ForEach(data,id: \.self){i in
                            
                            ZStack(alignment: .bottom){
                                
                                Color("Color")
                                    .frame(height: UIScreen.main.bounds.height / 3)
                                    .cornerRadius(20)
                                
                                VStack(spacing: 20){
                                
                                    Image(i.image)
                                        .resizable()
                                        .frame(width: UIScreen.main.bounds.width / 1.7)
                                        .onTapGesture {
                                            self.detailData = i
                                            self.detail.toggle()
                                        }
                                    HStack{
                                        
                                        VStack(alignment: .leading, spacing: 12){
                                            
                                            Text(i.title)
                                            
                                            Text("Apple Watch")
                                                .fontWeight(.bold)
                                                .font(.title)
                                        }
                                        .foregroundColor(.white)
                                        
                                        Spacer(minLength: 0)
                                        
                                        Button(action: {
                                            
                                        }) {
                                            Image(systemName: "plus")
                                                .font(.title)
                                                .foregroundColor(.white)
                                                .padding()
                                                .background(Color("Color1"))
                                                .clipShape(Circle())
                                        }
                                    }
                                }
                                .padding(.horizontal)
                                .padding(.bottom)
                            }
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 25)
                }
                
                HStack{
                    
                    Button(action: {
                        
                        self.tab = 0
                        
                    }) {
                        Image(systemName: "suit.heart.fill")
                            .font(.title)
                            .foregroundColor(self.tab == 0 ? .black : Color.black.opacity(0.25))
                    }
                    
                    Spacer(minLength: 0)
                    
                    Button(action: {
                        
                        self.tab = 1
                        
                    }) {
                        Image(systemName: "safari")
                            .font(.title)
                            .foregroundColor(self.tab == 1 ? .black : Color.black.opacity(0.25))
                    }
                    
                    Spacer(minLength: 0)
                    
                    Button(action: {
                        
                        self.tab = 2
                        
                    }) {
                        Image(systemName: "person.circle")
                            .font(.title)
                            .foregroundColor(self.tab == 2 ? .black : Color.black.opacity(0.25))
                    }
                    
                }
                .padding(.horizontal, 30)
                .padding(.top, 25)
                .padding(.bottom, self.bottom == 0 ? 15 : self.bottom)
                .background(Color.white)
                .clipShape(CShape())
            }
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct CShape : Shape {
    func path(in rect: CGRect) -> Path {
        
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: 45, height: 45))
        
        return Path(path.cgPath)
    }
}

struct Detail: View {
    
    @State var txt = ""
    @Binding var detailData: Watch
    @Binding var detai: Bool
    @State var index = 0
    var bottom = UIApplication.shared.windows.first?.safeAreaInsets.bottom
    
    var body: some View{
        ZStack{
            Color("Color").edgesIgnoringSafeArea(.all)
            
            VStack{
                
                HStack{
                    
                    Button(action: {
                        
                    }) {
                        Image(systemName: "line.horizontal.3.decrease.circle")
                            .font(.title)
                            .foregroundColor(.white)
                            .padding(.horizontal)
                    }
                    Spacer()
                    Button(action: {
                        
                    }) {
                        Image(systemName: "cart")
                            .font(.title)
                            .foregroundColor(.white)
                            .padding(.horizontal)
                    }
                }
                .padding(.vertical)
                
                HStack(spacing: 15){
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                    
                    TextField("Want to Search Anything..", text: self.$txt)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(8)
                .padding(.horizontal)
                
                HStack{
                    VStack(alignment: .leading, spacing: 12){
                        
                        Text(self.detailData.title)
                        
                        Text("Apple Watch Series 5")
                            .font(.title)
                            .fontWeight(.bold)
                    }
                    .foregroundColor(.white)
                    Spacer()
                }
                .padding(.vertical)
                .padding(.horizontal)
                
                HStack{
                    
                    VStack(alignment: .leading, spacing: 12){
                        
                        Text("Color")
                            .foregroundColor(Color.white.opacity(0.6))
                        
                        Text(self.detailData.color)
                            .fontWeight(.bold)
                            .font(.title)
                            .foregroundColor(.white)
                        
                        Text("Price")
                            .foregroundColor(Color.white.opacity(0.6))
                            .padding(.top)
                        
                        Text(self.detailData.price)
                            .fontWeight(.bold)
                            .font(.title)
                            .foregroundColor(.white)
                        
                    }
                    .offset(y: -50)
                    
                    Spacer(minLength: 0)
                    
                    Image(self.detailData.image)
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width / 2, height: UIScreen.main.bounds.height / 2.5)
                        .rotationEffect(.init(degrees: 10))
                }
                .padding(.horizontal)
                .padding(.bottom, -60)
                .zIndex(5)
                
                ZStack(alignment: .topLeading){
                    
                    VStack{
                        
                        ScrollView(UIScreen.main.bounds.height < 750 ? .vertical : .init(), showsIndicators: false){
                            
                            VStack{
                                
                                HStack(spacing: 0){
                                    Button(action: {
                                        self.index = 0
                                    }) {
                                        Text("Details")
                                            .foregroundColor(self.index == 0 ? .white : Color.black.opacity(0.6))
                                            .padding(.vertical, 10)
                                            .padding(.horizontal, 25)
                                            .background(self.index == 0 ? Color("Color1") : Color.clear)
                                            .cornerRadius(8)
                                    }
                                    
                                    Button(action: {
                                        self.index = 1
                                    }) {
                                        Text("Description")
                                            .foregroundColor(self.index == 1 ? .white : Color.black.opacity(0.6))
                                            .padding(.vertical, 10)
                                            .padding(.horizontal, 25)
                                            .background(self.index == 1 ? Color("Color1") : Color.clear)
                                            .cornerRadius(8)
                                    }
                                    Spacer()
                                }
                                
                                
                                if self.index == 0 {
                                    
                                    HStack(spacing: 20){
                                        
                                        VStack(spacing: 12){
                                            
                                            Text("15mm")
                                                .font(.title)
                                                .fontWeight(.bold)
                                                .foregroundColor(Color.black.opacity(0.8))
                                            
                                            Text("Strip Width")
                                                .foregroundColor(Color.black.opacity(0.4))
                                            
                                        }
                                        
                                        VStack(spacing: 12){
                                            
                                            Text("Leather")
                                                .font(.title)
                                                .fontWeight(.bold)
                                                .foregroundColor(Color.black.opacity(0.8))
                                            
                                            Text("Strip Material")
                                                .foregroundColor(Color.black.opacity(0.4))
                                            
                                        }
                                        
                                        VStack(spacing: 12){
                                            
                                            Text("50m")
                                                .font(.title)
                                                .fontWeight(.bold)
                                                .foregroundColor(Color.black.opacity(0.8))
                                            
                                            Text("Water Resist")
                                                .foregroundColor(Color.black.opacity(0.4))
                                            
                                        }
                                    }
                                    .padding(.top)
                                }
                                
                                else {
                                    Text("The Apple Watch Series 5 features a new Always-on Display, Built-in Compass for advanced Navigation features, and a Titanium Case option.")
                                    .foregroundColor(.black)
                                    .padding(.top)
                                    
                                }
                            }
                            .padding(.horizontal,25)
                        }
                        .padding(.top, 60)
                        
                        HStack{
                            
                            Button(action: {
                                
                            }) {
                                 Text("Add to cart")
                                    .foregroundColor(.white)
                                    .padding(.vertical)
                                    .frame(width: UIScreen.main.bounds.width / 1.5)
                                    .background(Color("Color1"))
                                    .cornerRadius(10)
                            }
                            .shadow(radius: 5)
                            
                            Spacer(minLength: 0)
                            
                            Button(action: {
                                
                                self.detai.toggle()
                                
                            }) {
                                Image(systemName: "xmark")
                                    .font(.title)
                                    .foregroundColor(Color.black.opacity(0.8))
                                    .padding(.horizontal)
                            }
                        }
                        .padding(.top,10)
                        .padding(.horizontal, 25)
                        .padding(.bottom,self.bottom == 0 ? 15 : self.bottom)
                    }
                    .background(Color.white)
                    .clipShape(CShape())
                    
                    Button(action: {
                        
                    }) {
                        Image(systemName: "plus")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color("Color1"))
                            .clipShape(Circle())
                    }
                    .padding(.leading, 50)
                    .offset(y: -30)
                }
            }
        }
        .edgesIgnoringSafeArea(.bottom)
    }
    
}

var menu = ["ALL", "CLASSIC", "GRAND", "FORMAL", "ORIGINAL", "TREND"]

struct Watch: Identifiable,Hashable {
    var id: Int
    var color: String
    var price: String
    var image: String
    var title: String
}

var data = [
    
    Watch(id: 0, color: "Dark Black", price: "$500", image: "black", title: "Classic Black"),
    
    Watch(id: 1, color: "Light Yellow", price: "$450", image: "yellow", title: "Classic Yellow"),
    
    Watch(id: 2, color: "Rose Gold", price: "$510", image: "gold", title: "Classic Gold"),
    
    Watch(id: 3, color: "Red", price: "$500", image: "red", title: "Classic Red"),
    
    Watch(id: 4, color: "White", price: "$400", image: "white", title: "Classic White"),
]
