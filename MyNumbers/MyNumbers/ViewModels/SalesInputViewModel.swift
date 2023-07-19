//
//  SalesInputViewModel.swift
//  MyNumbers
//
//  Created by richard Haynes on 7/19/23.
//

import Foundation
import CoreData
final class SalesInputViewModel : ObservableObject {
    private var context : NSManagedObjectContext  = PersistenceController.shared.container.viewContext
    
    func saveSales(salesAmount: Double, salesDate: Date){
        
        let sale = Sale(context: context)
        sale.id = UUID()
        sale.saleDate = salesDate
        sale.saleAmount = salesAmount
        do {
            try context.save()
        }
        catch {
            
        }
    }
}
