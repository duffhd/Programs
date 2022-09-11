//
// Created by bluesden on 11/09/22.
//

import SwiftUI
import Foundation

struct Customer {
    let name: String
    let tipPercentage: Int
    let amountSpent: Double
}

struct CustomerView: View {
    let customer: Customer

    var body: some View {
        HStack {
            Text(customer.name)
            Text("Spent: \(customer.amountSpent, specifier: "%.2f")")
                    .frame(maxWidth: .infinity)
            Text("Tip: \(customer.tipPercentage)%")
        }
    }
}
