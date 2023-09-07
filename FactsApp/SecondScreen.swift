//
//  SecondScreen.swift
//  FactsApp
//
//  Created by Arina on 07.09.2023.
//

import SwiftUI

struct SecondScreen: View {
    @State private var apiResult = ""
    @State private var isLoading = false
    
    func fetchData() {
        isLoading = true
        let url = URL(string: "https://api.api-ninjas.com/v1/facts?limit=3")!
        var request = URLRequest(url: url)
        request.setValue("YOUR_API_KEY", forHTTPHeaderField: "X-Api-Key")
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print("Ошибка: \(error?.localizedDescription ?? "Неизвестная ошибка")")
                isLoading = false
                return
            }
            if let result = String(data: data, encoding: .utf8) {
                apiResult = result
            }
            isLoading = false
        }
        task.resume()
    }
    
    var body: some View {
        VStack {
            if isLoading {
                ProgressView("Загрузка...")
            } else {
                Text(apiResult)
                    .padding()
                    .onAppear {
                        fetchData()
                    }
            }
        }
    }
}

struct SecondScreen_Previews: PreviewProvider {
    static var previews: some View {
        SecondScreen()
    }
}
