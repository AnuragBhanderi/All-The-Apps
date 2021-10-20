//
//  CallView.swift
//  WhatsApp TabView
//
//  Created by Anurag Bhanderi on 30/05/21.
//

import SwiftUI

struct CallView: View {
    var body: some View {
        VStack {
            ZStack{
                Circle()
                    .frame(width: 300, height: 300)
                    .foregroundColor(.red)
                Image(systemName: "phone")
                    .resizable()
                    .frame(width: 150, height: 150)
            }
            Text("Call")
                .padding()
                .font(.system(size: 60, weight: .bold))
        }
        .padding()
    }
}

struct CallView_Previews: PreviewProvider {
    static var previews: some View {
        CallView()
    }
}
