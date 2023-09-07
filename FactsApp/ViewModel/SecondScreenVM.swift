//
//  SecondScreenVM.swift
//  FactsApp
//
//  Created by Arina on 07.09.2023.
//

import Foundation

class SecondScreenVM: ObservableObject {
    @Published var apiResults: [String] = []
    @Published var isLoading = false

    func fetchData() {
        isLoading = true
        let url = URL(string: "https://api.api-ninjas.com/v1/facts?limit=3")!
        var request = URLRequest(url: url)
        request.setValue("FqtoJexqlRTYlLEy7512zg==kr4MRfDlDlPbtezx", forHTTPHeaderField: "X-Api-Key")
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                self.isLoading = false
                if let data = data {
                    do {
                        let decoder = JSONDecoder()
                        let facts = try decoder.decode([Fact].self, from: data)
                        self.apiResults = facts.map { $0.fact }
                    } catch {
                        print("Ошибка при декодировании JSON: \(error.localizedDescription)")
                    }
                } else {
                    print("Ошибка: \(error?.localizedDescription ?? "Неизвестная ошибка")")
                }
            }
        }
        task.resume()
    }
}
