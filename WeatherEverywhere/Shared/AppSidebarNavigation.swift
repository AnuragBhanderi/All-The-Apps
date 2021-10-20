//
//  AppSidebarNavigation.swift
//  WeatherEverywhere
//
//  Created by Anurag Bhanderi on 19/07/21.
//

import SwiftUI

struct AppSidebarNavigation: View {
    
    enum NavigationItem {
        case myWeather
        case settings
    }
    
    @State private var selection: Set<NavigationItem> = [.myWeather]
    
    var sidebar: some View{
        List(selection: $selection){
            NavigationLink(
                destination: MyWeatherView()){
                Label("My Weather", systemImage: "thermometer.sun.fill")
            }
            .accessibility(label: Text("My Weather"))
            .tag(NavigationItem.myWeather)
        }
        .overlay(BottomButton(), alignment: .bottom)
        .listStyle(SidebarListStyle())
    }
    
    struct BottomButton: View {
        var body: some View{
            VStack(alignment: .leading, spacing: 0){
                Divider()
                Button(action: {
                    
                }){
                    Label("Settings", systemImage: "gear")
                        .padding(6)
                        .contentShape(Rectangle())
                }
                .accessibility(label: Text("Settings"))
                .padding(.vertical, 8)
                .padding(.horizontal, 16)
                .buttonStyle(PlainButtonStyle())
            }
        }
    }
    
    var body: some View {
        NavigationView{
            sidebar
            MyWeatherView()
            Text("Select a Day..")
        }
    }
}

struct AppSidebarNavigation_Previews: PreviewProvider {
    static var previews: some View {
        AppSidebarNavigation()
    }
}
