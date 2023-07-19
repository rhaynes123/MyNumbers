//
//  MyNumbersApp.swift
//  MyNumbers
//
//  Created by richard Haynes on 7/19/23.
//

import SwiftUI

@main
struct MyNumbersApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            MainTabView()
        }
    }
}
