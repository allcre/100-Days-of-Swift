//
//  ContentView.swift
//  Units Converter
//
//  Created by Allison on 2023-05-24.
//

import SwiftUI

struct ContentView: View {
    
    enum tempUnits: String, CaseIterable {
        case celsius = "°C"
        case fahrenheit = "°F"
        case kelvin = "°K"
    }

    
    @State private var unit1 = tempUnits.celsius
    @State private var unit2 = tempUnits.fahrenheit

    @State private var temp1: Double = 0.0
    
    var temp1K: Double {
        switch unit1 {
        case .celsius:
            return temp1 + 273.15
        case .fahrenheit:
            return ((temp1 - 32) * 5 / 9 + 273.15)
        case .kelvin:
            return temp1
        }
    }
    
    var temp2: Double {
        switch unit2 {
        case .celsius:
            return temp1K - 273.15
        case .fahrenheit:
            return ((temp1K - 273.15) * 9/5 + 32)
        case .kelvin:
            return temp1K
        }
    }
    
    @FocusState private var focused: Bool
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", value: $temp1, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($focused)
                    
                    Picker("unit 1", selection: $unit1) {
                        ForEach(tempUnits.allCases, id: \.self) {
                            Text($0.rawValue)
                        }
                    }
                    .pickerStyle(.segmented)

                } header: {
                    Text("original temperature:")
                }
                
                Section {
                    Text("\(temp2.formatted())")
                    
                    Picker("unit 2", selection: $unit2) {
                        ForEach(tempUnits.allCases, id: \.self) {
                            Text($0.rawValue)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Converted temperature:")
                }
            }
            .navigationBarTitle("Temperature Converter")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    
                    Button("Done") {
                        focused = false
                    }
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
