import SwiftUI

struct ContentView: View {
    @ObservedObject var expenses = Expenses()
    @State private var  showingAddExpense = false
    
    var body: some View {
        NavigationView {
            if expenses.items.count > 0 {
                ListView(expenses: expenses)
                    .navigationBarTitle("Expense Tracker")
                    .navigationBarItems(leading: EditButton(), trailing: Button(action: {
                        self.showingAddExpense = true
                    }) {
                        Image(systemName: "plus")
                    })
                    
                    .sheet(isPresented: $showingAddExpense) {
                        AddView(expenses: self.expenses)
                    }
            } else {
                Text("Tap + to get started.")
                    .navigationBarTitle("Expense Tracker")
                    .navigationBarItems(trailing: Button(action: {
                        self.showingAddExpense = true
                    }) {
                        Image(systemName: "plus")
                    })
                    
                    .sheet(isPresented: $showingAddExpense) {
                        AddView(expenses: self.expenses)
                    }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
