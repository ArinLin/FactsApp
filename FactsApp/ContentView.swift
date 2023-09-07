//
//  ContentView.swift
//  FactsApp
//
//  Created by Arina on 07.09.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            FirstScreen()
                .tabItem {
                    Label("Сохранение", systemImage: "doc.text.fill")
                }
            
            SecondScreen()
                .tabItem {
                    Label("API", systemImage: "arrow.down.doc.fill")
                }
            
            ThirdScreen()
                .tabItem {
                    Label("Перейти", systemImage: "arrow.right.circle.fill")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
