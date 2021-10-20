//
//  ContentView.swift
//  MapKit_Demo
//
//  Created by Anurag Bhanderi on 18/08/21.
//

import SwiftUI

struct ContentView: View {
       @State var pins: [Pin] = [
      Pin(title: "Ortega Park", coordinate: .init(latitude: 37.342226, longitude: -122.025617)),
    ]

    var body: some View {
        MapView(pins: $pins)
            .edgesIgnoringSafeArea(.all)
    }
}
