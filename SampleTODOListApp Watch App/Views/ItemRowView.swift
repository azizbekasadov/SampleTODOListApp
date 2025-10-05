//
//  ItemRowView.swift
//  SampleTODOListApp Watch App
//
//  Created by Azizbek Asadov on 05.10.2025.
//

import SwiftUI

struct ItemRowView: View {
    @Binding var item: ListItem
    
    var body: some View {
        Text(item.description)
            .font(.caption)
            .fontWeight(.medium)
    }
}
