//
//  SecondScreen.swift
//  FactsApp
//
//  Created by Arina on 07.09.2023.
//

import SwiftUI

struct SecondScreen: View {
    @ObservedObject var viewModel = SecondScreenVM()
    
    var body: some View {
        VStack {
            if viewModel.isLoading {
                ProgressView("Загрузка...")
            } else {
                List(viewModel.apiResults, id: \.self) { fact in
                    Text(fact)
                }
            }
        }
        .onAppear {
            viewModel.fetchData()
        }
    }
}

struct SecondScreen_Previews: PreviewProvider {
    static var previews: some View {
        SecondScreen()
    }
}
