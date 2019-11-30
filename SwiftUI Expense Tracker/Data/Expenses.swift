import Foundation

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]()
}
