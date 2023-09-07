//
//  FactsAppApp.swift
//  FactsApp
//
//  Created by Arina on 07.09.2023.
//

import SwiftUI

@main
struct FactsAppApp: App {
    @AppStorage("isFirstLaunch") var isFirstLaunch: Bool = true
    @AppStorage("ShowFourthScreen") var showFourthScreen = false 
    @Environment(\.scenePhase) private var scenePhase

    var body: some Scene {
        WindowGroup {
            if isFirstLaunch {
                ContentView()
                    .onChange(of: scenePhase) { newPhase in
                        if newPhase == .inactive {
                            isFirstLaunch = false
                        }
                    }
            } else if showFourthScreen {
                FourthScreen()
            } else {
                ContentView()
            }
        }
    }
}
