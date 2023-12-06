//
//  MVcoinTestAppApp.swift
//  MVcoinTestApp
//
//  Created by Emmanuel Agene on 06/12/2023.
//

import SwiftUI

@main
struct MVcoinTestAppApp: App {
    
    @StateObject private var viewModel = RootModel(webservice: WebService())
    
    var body: some Scene {
        WindowGroup {
            HomeView().environmentObject(viewModel)
        }
    }
}
