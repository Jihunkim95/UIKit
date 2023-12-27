//
//  CoreDataDemoApp.swift
//  CoreDataDemo
//
//  Created by Neil Smyth on 7/28/22.
//

import SwiftUI

@main
struct CoreDataDemoApp: App {
    
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext,
                                persistenceController.container.viewContext)
        }
    }
}
