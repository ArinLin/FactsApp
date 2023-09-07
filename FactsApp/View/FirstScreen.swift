//
//  FirstScreen.swift
//  FactsApp
//
//  Created by Arina on 07.09.2023.
//

import SwiftUI

struct FirstScreen: View {
    @ObservedObject var viewModel = FirstScreenVM()

    var body: some View {
        VStack {
            TextField("Введите данные", text: $viewModel.inputText)
                .padding()

            Button(action: {
                viewModel.saveData()
            }) {
                Text("Сохранить")
            }

            List(viewModel.savedData, id: \.self) { data in
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
