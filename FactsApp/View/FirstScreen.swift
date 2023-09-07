//
//  FirstScreen.swift
//  FactsApp
//
//  Created by Arina on 07.09.2023.
//

import SwiftUI

struct FirstScreen: View {
    @State private var inputText = ""
    @State private var savedData: [String] = UserDefaults.standard.stringArray(forKey: "SavedData") ?? []
    
    var body: some View {
        VStack {
            TextField("Введите данные", text: $inputText)
                .padding()
            
            Button(action: {
                if !inputText.isEmpty {
                    savedData.append(inputText)
                    UserDefaults.standard.set(savedData, forKey: "SavedData")
                    inputText = ""
                }
            }) {
                Text("Сохранить")
            }
            
            List(savedData, id: \.self) { data in
                Text(data)
            }
        }
    }
}

struct FirstScreen_Previews: PreviewProvider {
    static var previews: some View {
        FirstScreen()
    }
}
