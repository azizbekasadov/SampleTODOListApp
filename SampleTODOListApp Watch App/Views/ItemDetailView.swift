//
//  ItemDetailView.swift
//  SampleTODOListApp Watch App
//
//  Created by Azizbek Asadov on 05.10.2025.
//

import SwiftUI

struct ItemDetailView: View {
    @Binding var item: ListItem
    
    var body: some View {
        Form {
            Section("List item") {
                TextField("Item", text: $item.description, prompt: Text("List Item"))
            }
            
            Stepper(
                value: $item.estimatedWork,
                in: (0.0...14.0),
                step: 0.5,
                format: .number
            ) {
                Text("\(item.estimatedWork, specifier: "%.1f") days")
            }
            
            Toggle(isOn: $item.isComplete) {
                Text("Completed")
            }
            
            ShareLink(
                item: item.description,
                subject: Text("I need your help!"),
                message: Text("I need your help in finishing this"),
                preview: SharePreview("\(item.description)")
            )
            .buttonBorderShape(.roundedRectangle)
            .buttonStyle(.glassProminent)
        }
    }
}

#Preview {
    ItemDetailView(item: .constant(.init("Hello World!")))
}
