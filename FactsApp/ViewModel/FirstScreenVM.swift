//
//  FirstScreenVM.swift
//  FactsApp
//
//  Created by Arina on 07.09.2023.
//

import Foundation

class FirstScreenVM: ObservableObject {
    @Published var inputText = ""
    @Published var savedData: [String] = []

    init() {
        savedData = UserDefaults.standard.stringArray(forKey: "SavedData") ?? []
    }

    func saveData() {
        if !inputText.isEmpty {
            savedData.append(inputText)
            UserDefaults.standard.set(savedData, forKey: "SavedData")
            inputText = ""
        }
    }
}
