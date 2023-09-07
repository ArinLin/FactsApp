//
//  FourthScreen.swift
//  FactsApp
//
//  Created by Arina on 07.09.2023.
//

import SwiftUI

struct FourthScreen: View {
    var body: some View {
        WebView(url: URL(string: "https://www.google.com")!)
    }
}

struct FourthScreen_Previews: PreviewProvider {
    static var previews: some View {
        FourthScreen()
    }
}
