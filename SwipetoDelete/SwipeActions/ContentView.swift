//
//  ContentView.swift
//  SwipeActions
//
//  Created by Anurag Bhanderi on 01/07/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ListView()
    }
}

struct ListView: View{
    
    @State var numbers = [Int]()
    @State var currentNum = 1
    
    var body: some View{
        NavigationView {
            VStack{
                List{
                    ForEach(numbers, id: \.self){
                        Text("\($0)")
                    }
                    .onDelete(perform: removeRows)
                }
                Button("Add Number"){
                    self.numbers.append(self.currentNum)
                    self.currentNum += 1
                }
            }
            .navigationBarItems(trailing: EditButton())
        }
    }
    
    func removeRows(at offset: IndexSet){
        numbers.remove(atOffsets: offset)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
