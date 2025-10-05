//
//  ListViewModel.swift
//  SampleTODOListApp Watch App
//
//  Created by Azizbek Asadov on 05.10.2025.
//

import Combine
import Foundation

class ListViewModel: NSObject, ObservableObject {
    @Published var items: [ListItem] = []
    
}
