//
//  Camera View.swift
//  WhatsApp TabView
//
//  Created by Anurag Bhanderi on 30/05/21.
//

import SwiftUI

struct Camera_View: View {
    var body: some View {
        VStack {
            ZStack{
                Circle()
                    .frame(width: 300, height: 300)
                    .foregroundColor(.green)
                Image(systemName: "camera")
                    .resizable()
                    .frame(width: 200, height: 180)
            }
            Text("Camera")
                .padding()
                .font(.system(size: 60, weight: .bold))
        }
        .padding()
    }
}

struct Camera_View_Previews: PreviewProvider {
    static var previews: some View {
        Camera_View()
    }
}
