//
//  SalesGraphView.swift
//  MyNumbers
//
//  Created by richard Haynes on 7/19/23.
//
/*
 https://sarunw.com/posts/swiftui-picker-enum/
 https://sarunw.com/posts/swiftui-form-picker-styles/
 */

import SwiftUI
import Charts
enum GraphMode: String, CaseIterable {
    case ListMode = "List"
    case ChartMode = "Chart"
    case Both = "Both"
}
struct SalesGraphView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Sale.saleDate, ascending: true)],
        animation: .default)
    private var sales: FetchedResults<Sale>
    @State private var mode : GraphMode = GraphMode.Both
    
    var body: some View {
        ZStack {
            VStack {
                Image("money")
                    .resizable()
                    .scaledToFit()
                Text("Sales Over Time")
                Picker("Mode", selection: $mode){
                    ForEach(GraphMode.allCases, id: \.self){
                        Text($0.rawValue)
                    }
                }.pickerStyle(.segmented)
                switch self.mode {
                case .ChartMode :
                    ChartView(sales: self.sales)
                case .ListMode :
                    ListView(sales: self.sales)
                case .Both :
                    ChartView(sales: self.sales)
                    ListView(sales: self.sales)
                }
                
            }.padding()
        }
            
    }
    
}

struct SalesGraphView_Previews: PreviewProvider {
    static var previews: some View {
        SalesGraphView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}

fileprivate struct ChartView : View {
    var sales : FetchedResults<Sale>
    
    init(sales : FetchedResults<Sale>) {
        self.sales = sales
    }
    var body: some View {
        Chart {
            ForEach(sales) { sale in
                LineMark(
                    x: .value("Month", sale.saleDate!, unit: .weekOfMonth),
                    y: .value("Sales", sale.saleAmount)
                ).foregroundStyle(Color.green.gradient)
                    
                
            }
        }.frame(height: 180)
    }
}

fileprivate struct ListView : View {
    var sales : FetchedResults<Sale>
    
    init(sales : FetchedResults<Sale>) {
        self.sales = sales
    }
    var body: some View {
        List {
            ForEach(sales) { sale in
                Text("\(sale.saleAmount.formatted(.currency(code: "USD"))) Sale Made on \(sale.saleDate!)")
            }
        }
    }
}
