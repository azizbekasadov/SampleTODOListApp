//
//  ItemList.swift
//  SampleTODOListApp Watch App
//
//  Created by Azizbek Asadov on 05.10.2025.
//

import SwiftUI

struct ItemList: View {
    @StateObject private var viewModel = ListViewModel()
    
    var body: some View {
        List {
            ForEach($viewModel.items) { $item in
                Text(item.description)
                    .font(.caption)
                    .fontWeight(.medium)
            }
            
            if viewModel.items.isEmpty {
                Text("No tasks yet.")
                    .font(.caption)
                    .fontWeight(.medium)
            }
        }
        .toolbar(content: {
            AddItemView()
        })
        .navigationTitle("Tasks")
    }
}

#Preview {
    ItemList()
}
