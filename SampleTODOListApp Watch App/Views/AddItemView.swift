//
//  AddItemView.swift
//  SampleTODOListApp Watch App
//
//  Created by Azizbek Asadov on 05.10.2025.
//

import SwiftUI

struct AddItemView: View {
    @EnvironmentObject private var viewModel: ListViewModel
    
    var body: some View {
        TextFieldLink(prompt: Text("New Item")) {
            Label("Add Item", systemImage: "plus")
        } onSubmit: {
            viewModel.items.append(ListItem($0))
        }

    }
}


#Preview {
    AddItemView()
}
