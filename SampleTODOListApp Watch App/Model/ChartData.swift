//
//  ChartData.swift
//  SampleTODOListApp Watch App
//
//  Created by Azizbek Asadov on 05.10.2025.
//

import Foundation

struct ChartData {
    struct DataElement: Identifiable {
        let id: UUID = UUID()
        let date: Date
        let itemsComplete: Double
    }
    
    static func createData(_ items: [ListItem]) -> [DataElement] {
        return Dictionary(
            grouping: items,
            by: \.completionDate
        )
        .compactMap {
            guard let date = $0 else { return nil }
            return DataElement(date: date, itemsComplete: Double($1.count))
        }
        .sorted {
            $0.date < $1.date
        }
    }
}
