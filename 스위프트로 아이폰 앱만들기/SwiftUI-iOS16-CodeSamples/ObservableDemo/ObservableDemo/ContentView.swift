//
//  ContentView.swift
//  ObservableDemo
//
//  Created by Neil Smyth on 9/12/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var timerData: TimerData = TimerData()

    var body: some View {

        NavigationStack {
            VStack {
                Text("Timer count = \(timerData.timeCount)")
                
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                
                Button(action: resetCount) {
                    Text("Reset Counter")
                }
                
                NavigationLink(destination:
                           SecondView()) {
                    Text("Next Screen")
                }
                .padding()
            }
        }
        .environmentObject(timerData)
    }
    
    func resetCount() {
        timerData.resetCount()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
