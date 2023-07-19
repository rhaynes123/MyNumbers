//
//  SalesInputView.swift
//  MyNumbers
//
//  Created by richard Haynes on 7/19/23.
//

import SwiftUI

struct SalesInputView: View {
    @State private var saleAmount: Double = 0
    @State private var saleDate: Date = Date()
    @State private var displayAlert = false
    @StateObject private var salesModel : SalesInputViewModel = SalesInputViewModel()
    
    let saleAmountFormatter: NumberFormatter = {
       let currencyFormat = NumberFormatter()
        currencyFormat.numberStyle = .currency
        return currencyFormat
    }()
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Image("money")
                        .resizable()
                        .scaledToFit()
                }
                Section {
                    DatePicker("Date", selection: $saleDate)
                } header: {
                    Text("Date of Sale")
                }
                
                Section {
                    TextField("Amount", value: $saleAmount, formatter: saleAmountFormatter)
                } header: {
                    Text("Sale Amount")
                }
                
                Button("Record Sale") {
                    salesModel.saveSales(salesAmount: saleAmount, salesDate: saleDate)
                    displayAlert = true
                }.padding()
                    .frame(width: 300, height: 50, alignment: .center)
                    .background(Color.green)
                    .foregroundColor(Color.black)
                    .cornerRadius(10)
                    .alert(isPresented: $displayAlert){
                        Alert(title: Text("Sales Recorded"))
                    }
                
            }.navigationBarTitle("Sales Form")
            
        }
        
    }
}

struct SalesInputView_Previews: PreviewProvider {
    static var previews: some View {
        SalesInputView()
    }
}
