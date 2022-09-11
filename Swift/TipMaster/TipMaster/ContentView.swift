//
//  ContentView.swift
//  TipMaster
//
//  Created by bluesden on 05/09/22.
//
//

import SwiftUI

struct ContentView: View {
    @FocusState private var keyboardFocus: Bool
    @State private var currentName = ""
    @State private var moneySpent = 0.0

    @State private var numberOfPeople = 0
    @State private var customerArray = [Customer]()

    @State private var tipPercentage = [10, 20, 25, 30]
    @State private var chosenTip = 10

    @State private var totalAmount = 0.0
    @State private var totalPerPerson = 0.0

    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Client name ", text: $currentName)
                            .focused($keyboardFocus)
                    TextField("Money spent ", value: $moneySpent,
                            format: .currency(code: currencyCode()))
                            .keyboardType(.decimalPad)
                            .focused($keyboardFocus)
                }

                Section {
                    Picker("Tip percentage", selection: $chosenTip) {
                        ForEach(tipPercentage, id: \.self) { percentage in
                            Text("\(percentage)%")
                        }
                    }
                            .pickerStyle(.segmented)
                } header: {
                    Text("Tip percentage")
                }

                Section {
                    Button("Add person") {
                        if (!currentName.isEmpty && moneySpent != 0.0) {
                            numberOfPeople += 1
                            calculateTotal()

                            let newCustomer = Customer(name: currentName,
                                    tipPercentage: chosenTip,
                                    amountSpent: moneySpent)
                            customerArray.append(newCustomer)
                            resetValues()
                        }
                    }
                }

                Section {
                    ForEach(customerArray, id: \.name) { customer in
                        CustomerView(customer: customer)
                    }
                } header: {
                    Text("Customers")
                }

                Section {
                    Text(totalAmount, format: .currency(code: currencyCode()))
                } header: {
                    Text("Total")
                }

                Section {
                    Text(totalPerPerson, format: .currency(code: currencyCode()))
                } header: {
                    Text("Total per person")
                }
            }
                    .navigationTitle("TipMaster")
                    .toolbar {
                        ToolbarItemGroup(placement: .keyboard) {
                            Button("Done") {
                                keyboardFocus = false
                            }
                        }
                    }
        }
    }

    func calculateTotal() {
        let calculateTip = moneySpent / 100 * Double(chosenTip)
        let total = calculateTip + moneySpent
        totalAmount += total

        totalPerPerson = totalAmount / Double(numberOfPeople)
    }

    func resetValues() {
        moneySpent = 0.0
        currentName = ""
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}