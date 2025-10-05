//
//  ProductivityChartView.swift
//  SampleTODOListApp Watch App
//
//  Created by Azizbek Asadov on 05.10.2025.
//

import Charts
import SwiftUI

struct ProductivityChartView: View {
    @StateObject private var viewModel = ListViewModel()
    
    @State private var data: [ChartData.DataElement] = []
    
    @State private var crownOffset: Double = 0.0
    @State private var isCrownIdle: Bool = false
    @State private var crownPositionOpacity: Double = 0.2
    
    private let shortDateFormatStyle: Date.FormatStyle = .dateTime
            .day(.defaultDigits)
            .month(.abbreviated)
    
    private let integerFormatStyle = IntegerFormatStyle<Int>()
           .precision(.fractionLength(0))
    
    var body: some View {
        Group {
            if data.isEmpty {
                PlaceholderView()
            } else {
                ChartView()
            }
        }
        .navigationTitle("Productivity")
        .navigationBarTitleDisplayMode(.inline)
        .task {
            data = ChartData.createData(viewModel.items)
        }
    }
    
    @ViewBuilder
    private func ChartView() -> some View {
        Chart(data) { chartPoint in
            BarMark(
                x: .value("Date", chartPoint.date),
                y: .value("Completed", chartPoint.itemsComplete)
            )
            .foregroundStyle(.accent)
//            .annotation(position: isLastDataPoint(chartPoint) ? .topLeading : .topTrailing, spacing: 0) {
//                Text("\(chartPoint.itemsComplete, specifier: "%.0f")")
//                    .foregroundStyle(
//                        chartPoint.date == crownOffset ?
//                    )
//            }
//            
            RuleMark(x: .value("Date", crownOffset))
                .foregroundStyle(Color.yellow.opacity(crownPositionOpacity))
        }
        .chartXAxis {
            AxisMarks { _ in
                AxisValueLabel(format: shortDateFormatStyle)
            }
        }
        .chartYAxis {
            AxisMarks { value in
                AxisGridLine(stroke: StrokeStyle(lineWidth: 0.5))
                    .foregroundStyle(.gray)
                
                if value.index < (value.count - 1) {
                    AxisValueLabel(format: integerFormatStyle)
                }
            }
        }
        .focusable()
        .digitalCrownRotation(
            detent: $crownOffset,
            from: 0.0,
            through: Double(max(0, data.count - 1)),
            by: 1.0,
            sensitivity: .low,
            isContinuous: true,
            isHapticFeedbackEnabled: true,
            onChange: { event in
                isCrownIdle = false
                crownOffset = event.offset

            },
            onIdle: {
                isCrownIdle = true
            })
        .onChange(of: isCrownIdle, { oldValue, newValue in
            withAnimation(newValue ? .easeOut : .easeIn) {
                crownPositionOpacity = newValue ? 0.2 : 1.0
            }
        })
    }
    
    @ViewBuilder
    private func PlaceholderView() -> some View {
        Image(systemName: "chart.bar.fill")
    }
}

#Preview {
    NavigationStack {
        ProductivityChartView()
    }
}

