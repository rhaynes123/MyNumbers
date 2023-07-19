//
//  TabView.swift
//  MyNumbers
//
//  Created by richard Haynes on 7/19/23.
//

import SwiftUI

struct MainTabView: View {
    let persistenceController = PersistenceController.shared
    var body: some View {
        TabView {
            WelcomeView()
                .tabItem(){
                    Image(systemName: "house")
                    Text("Home")
                }
            SalesInputView()
                .tabItem() {
                Image(systemName: "dollarsign")
                Text("Record Sale")
            }
            SalesGraphView().environment(\.managedObjectContext, persistenceController.container.viewContext)
                .tabItem() {
                    Image(systemName: "chart.xyaxis.line")
                    Text("Sales")
                }
        }
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
