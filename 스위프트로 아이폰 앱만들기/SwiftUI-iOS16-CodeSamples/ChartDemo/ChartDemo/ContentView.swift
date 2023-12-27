//
//  ContentView.swift
//  ChartDemo
//
//  Created by Neil Smyth on 8/18/22.
//

import SwiftUI
import Charts

struct ContentView: View {
    var body: some View {

        let sales = [ (channel: "Retail", data: retailSales),
                        (channel: "Online", data: onlineSales) ]

        Chart {
            ForEach(sales, id: \.channel) { channels in
                ForEach(channels.data) { sales in
                    PointMark(
                        x: .value("Month", sales.month),
                        y: .value("Total", sales.total)
                    )
                    .foregroundStyle(by: .value("Channel", channels.channel))
                }
            }
        }
        .frame(height: 250)
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
