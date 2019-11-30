import Foundation

struct ExpenseItem: Codable, Identifiable {
    let id = UUID()
    let name: String
    let type: String
    let amount: Int
}
