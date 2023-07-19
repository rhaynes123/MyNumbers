//
//  SalesGraphView.swift
//  MyNumbers
//
//  Created by richard Haynes on 7/19/23.
//

import SwiftUI
import Charts
struct SalesGraphView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Sale.saleDate, ascending: true)],
        animation: .default)
    private var sales: FetchedResults<Sale>
    
    var body: some View {
        ZStack {
            
            VStack {
                Image("money")
                    .resizable()
                    .scaledToFit()
                Text("Sales Over Time")
                Chart {
                    ForEach(sales) { sale in
                        LineMark(
                            x: .value("Month", sale.saleDate!, unit: .weekOfMonth),
                            y: .value("Sales", sale.saleAmount)
                        ).foregroundStyle(Color.green.gradient)
                        
                    }
                }.frame(height: 180)
            }.padding()
        }
            
    }
}

struct SalesGraphView_Previews: PreviewProvider {
    static var previews: some View {
        SalesGraphView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
