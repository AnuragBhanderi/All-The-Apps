//
//  ContentView.swift
//  GaugeApp WatchKit Extension
//
//  Created by Anurag Bhanderi on 30/04/21.
//

import SwiftUI

struct ContentView: View {
    var gradient = Gradient(colors: [.green, .yellow, .orange, .red])
    
    var body: some View {
        Gauge(value: 30.0, in: 0.0 ... 100.0) {
            Text("Speed")
        } currentValueLabel: {
            Text("30")
                .foregroundColor(.yellow)
        } minimumValueLabel: {
            Text("0")
                .foregroundColor(.green)
        } maximumValueLabel: {
            Text("100")
                .foregroundColor(.green)
        }
        .gaugeStyle(CircularGaugeStyle(tint: gradient))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
