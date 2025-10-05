//
//  ListItem.swift
//  SampleTODOListApp Watch App
//
//  Created by Azizbek Asadov on 05.10.2025.
//

import Foundation

struct ListItem: Identifiable, Hashable {
    let id = UUID()
    
    var description: String
    var estimatedWork: Double = 1
    var creationDate: Date = Date()
    var completionDate: Date?
    
    var isComplete: Bool = false
    
    init(_ description: String) {
        self.description = description
    }
}
