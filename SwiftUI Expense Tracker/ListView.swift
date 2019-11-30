import SwiftUI

struct ListView: View {
    @ObservedObject var expenses: Expenses
    
    var body: some View {
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
    }
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(expenses: Expenses())
    }
}
