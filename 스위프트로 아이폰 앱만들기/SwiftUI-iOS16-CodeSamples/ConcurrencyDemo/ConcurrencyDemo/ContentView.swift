//
//  ContentView.swift
//  ConcurrencyDemo
//
//  Created by Neil Smyth on 9/12/22.
//

import SwiftUI

enum DurationError: Error {
    case tooLong
    case tooShort
}

struct MyStruct {
    var myResult: Date {
        get async {
            return await self.getTime()
        }
    }
    func getTime() async -> Date {
        sleep(5)
        return Date()
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
    
        let myStruct = MyStruct()
    
        Task {
            let date = await myStruct.myResult
            print(date)
        }
    }
    
/*
    func doSomething() async {
        
        var timeStamps: [Int: Date] = [:]
        
        await withTaskGroup(of: (Int, Date).self) { group in
            
            for i in 1...5 {
                group.addTask {
                    return(i, await takesTooLong())
                }
            }
            
            for await (task, date) in group {
                timeStamps[task] = date
            }
        }
        
        for (task, date) in timeStamps {
            print("Task = \(task), Date = \(date)")
        }
    }
  */
    
    func takesTooLong() async -> Date {
        sleep(5)
        return Date()
    }
    
    /*
    func doSomething() async {
        await withTaskGroup(of: Void.self) { group in
            for i in 1...5 {
                group.addTask {
                    let result = await takesTooLong()
                    print("Completed Task \(i) = \(result)")
                }
            }
        }
    }
    */
    
    /*
    func doSomething() async {
        print("Start \(Date())")
        do {
            try await takesTooLong(delay: 25)
        } catch DurationError.tooShort {
            print("Error: Duration too short")
        } catch DurationError.tooLong {
            print("Error: Duration too long")
        } catch {
            print("Unknown error")
        }
        print("End \(Date())")
    }
    
    func takesTooLong(delay: UInt32) async throws {
        
        if delay < 5 {
            throw DurationError.tooShort
        } else if delay > 20 {
            throw DurationError.tooLong
        }
        
        sleep(delay)
        print("Async task completed at \(Date())")
    }
    */
    /*
    func doSomething() async {
        print("Start \(Date())")
        async let result = takesTooLong()
        print("After async-let \(Date())")
        // Additional code to run concurrently with async function goes here
        print ("result = \(await result)")
        print("End \(Date())")
    }
    
    func takesTooLong() async -> Date {
        sleep(5)
        return Date()
    }
    */
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
