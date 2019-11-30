import SwiftUI

struct ContentView: View {
    @ObservedObject var expenses = Expenses()
    @State private var  showingAddExpense = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(expenses.items) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                        }
                        
                        Spacer()
                        if item.amount > 100 {
                            Text("$\(item.amount)")
                                .font(.title)
                                .foregroundColor(.red)
                        } else {
                            Text("$\(item.amount)")
                                .font(.title)
                        }
                    }
                }
                .onDelete(perform: removeItems)
            }
            .navigationBarTitle("Expense Tracker")
            .navigationBarItems(leading: EditButton(), trailing: Button(action: {
                self.showingAddExpense = true
            }) {
                Image(systemName: "plus")
            })
            
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: self.expenses)
            }
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
