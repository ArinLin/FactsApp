//
//  ThirdScreen.swift
//  FactsApp
//
//  Created by Arina on 07.09.2023.
//

import SwiftUI

struct ThirdScreen: View {
    @AppStorage("ShowFourthScreen") private var showFourthScreen = false
    
    var body: some View {
        VStack {
            Button(action: {
                showFourthScreen = true
            }) {
                Text("Перейти на 4-й экран")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .fullScreenCover(isPresented: $showFourthScreen) {
            FourthScreen()
        }
    }
}

struct ThirdScreen_Previews: PreviewProvider {
    static var previews: some View {
        ThirdScreen()
    }
}
