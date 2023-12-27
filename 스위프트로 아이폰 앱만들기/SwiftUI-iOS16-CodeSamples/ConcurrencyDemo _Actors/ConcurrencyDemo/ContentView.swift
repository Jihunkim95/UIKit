//
//  ContentView.swift
//  ConcurrencyDemo
//
//  Created by Neil Smyth on 8/1/22.
//

import SwiftUI

actor TimeStore {
    
    var timeStamps: [Int: Date] = [:]
    
    func addStamp(task: Int, date: Date) {
        timeStamps[task] = date
    }
}

struct ContentView: View {
    var body: some View {
        Button(action: {
            Task {
                await doSomething()
            }
        }) {
            Text("Do Something")
        }
    }
    
    func doSomething() async {
        
        let store = TimeStore()
        
        await withTaskGroup(of: Void.self) { group in
            for i in 1...5 {
                group.addTask {
                    await store.addStamp(task: i, date: await takesTooLong())
                }
            }
        }
        
        for (task, date) in await store.timeStamps {
                print("Task = \(task), Date = \(date)")
        }
    }
    
    func takesTooLong() async -> Date {
        sleep(5)
        return Date()
    }
    

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
