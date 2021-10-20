//
//  ContentView.swift
//  iExpense
//
//  Created by Anurag Bhanderi on 29/06/21.
//

import SwiftUI

struct ExpenseItem {
    var name: String
    var type: String
    var amount: Int
}

class Expenses: ObservableObject{
    @Published var items = [ExpenseItem]()
}

struct ContentView: View {
    
    @ObservedObject var expenses = Expenses()
    
    var body: some View{
        NavigationView{
            List{
                ForEach(expenses.items, id:\.name){ item in
                    Text(item.name)
                }
                .onDelete(perform: removeRow)
            }
            .navigationBarTitle("iExpense")
            .navigationBarItems(
                leading: EditButton(),
                trailing: Button(action: {
                    let expenses = ExpenseItem(name: "abc", type: "xyz", amount: 100)
                    self.expenses.items.append(expenses)
                }, label: {
                    Image(systemName: "plus")
                })
            )
        }
    }
    
    func removeRow(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
