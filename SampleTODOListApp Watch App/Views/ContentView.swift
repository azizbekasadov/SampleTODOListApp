//
//  ContentView.swift
//  SampleTODOListApp Watch App
//
//  Created by Azizbek Asadov on 05.10.2025.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var viewModel: ListViewModel
    
    var body: some View {
        TabView {
            NavigationStack {
                ItemList()
            }
            
            NavigationStack {
                ProductivityChartView()
            }
        }
        .tabViewStyle(.page)
    }
}

#Preview {
    ContentView()
}
