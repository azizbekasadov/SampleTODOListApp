//
//  SampleTODOListAppApp.swift
//  SampleTODOListApp Watch App
//
//  Created by Azizbek Asadov on 05.10.2025.
//

import SwiftUI

@main
struct SampleTODOListApp_Watch_AppApp: App {
    @StateObject private var viewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ContentView()
            }
            .environmentObject(viewModel)
        }
    }
}
