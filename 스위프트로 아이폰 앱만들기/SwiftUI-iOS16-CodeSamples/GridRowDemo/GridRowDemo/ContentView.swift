//
//  ContentView.swift
//  GridRowDemo
//
//  Created by Neil Smyth on 8/3/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Grid(alignment: .topLeading) {
                
            GridRow(alignment: .bottom) {
                CellContent(index: 0, color: .orange)
                Image(systemName: "record.circle.fill")
                    .gridColumnAlignment(.trailing)
                Image(systemName: "record.circle.fill")
                    .gridCellAnchor(.center)
                Image(systemName: "record.circle.fill")
                    .gridCellAnchor(.top)
                CellContent(index: 0, color: .yellow)
                
            }
            .font(.largeTitle)
            
            GridRow {
                CellContent(index: 0, color: .orange)
                Image(systemName: "record.circle.fill")
                Image(systemName: "record.circle.fill")
                Image(systemName: "record.circle.fill")
                CellContent(index: 0, color: .yellow)
                
            }
            .font(.largeTitle)
            
            GridRow {
                ForEach(1...5, id: \.self) { index in
                        CellContent(index: index, color: .red)
                }
            }

            GridRow {
                ForEach(6...8, id: \.self) { index in
                    CellContent(index: index, color: .blue)
                }
            }

            GridRow {
                ForEach(11...12, id: \.self) { index in
                    CellContent(index: index, color: .green)
                }
            }
            
            CellContent(index: 16, color: .blue)

            GridRow {
                CellContent(index: 17, color: .orange)
                    .gridCellColumns(2)
                CellContent(index: 18, color: .indigo)
                    .gridCellColumns(3)
            }
        }
        .padding()
    }
}

struct CellContent: View {
    var index: Int
    var color: Color

    var body: some View {
        Text("\(index)")
            .frame(minWidth: 50, maxWidth: .infinity, minHeight: 100)
            .background(color)
            .cornerRadius(8)
            .font(.system(.largeTitle))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
