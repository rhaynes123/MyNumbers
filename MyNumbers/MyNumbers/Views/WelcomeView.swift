//
//  WelcomeView.swift
//  MyNumbers
//
//  Created by richard Haynes on 7/19/23.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        ZStack {
            
            VStack {
                Image("money")
                    .resizable()
                    .scaledToFit()
                Text("Welcome To My Numbers!")
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                    .shadow(color: Color.black, radius: 10)
                
            }
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
