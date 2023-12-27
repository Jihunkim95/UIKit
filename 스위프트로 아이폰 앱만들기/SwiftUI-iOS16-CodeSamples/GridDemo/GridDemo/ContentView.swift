//
//  ContentView.swift
//  GridDemo
//
//  Created by Neil Smyth on 7/28/22.
//

import SwiftUI

struct ContentView: View {
    
    private var colors: [Color] = [.blue, .yellow, .green]
    private var gridItems = [GridItem(.fixed(150)),
                             GridItem(.flexible(minimum: 50)), GridItem(.fixed(150))]


    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: gridItems, spacing: 5) {
                    ForEach((0...99), id: \.self) { index in
                        CellContent(index: index,
                               color: colors[index % colors.count])
                    
                    }
                }
            .padding(5)
        }
    }
}

struct CellContent: View {
    var index: Int
    var color: Color

    var body: some View {
        Text("\(index)")
            .frame(minWidth: 75, minHeight: 50, maxHeight: .infinity)
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
